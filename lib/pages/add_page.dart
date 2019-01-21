import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:appfood/partial/addphoto_partial.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;

File imageUpload;
String filename;
String urlImage;
int imageType;
int selectedYear;
int selectedMonth;
int selectedDay;

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  initState() {
    super.initState();

    DateTime now = DateTime.now();

    setState(() {
      selectedYear = int.parse(DateFormat('yyyy').format(now));
      selectedMonth = int.parse(DateFormat('MM').format(now));
      selectedDay = int.parse(DateFormat('dd').format(now));
    });
  }

  Future _getImage(type) async {
    var selectImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yMdHms').format(now);

    var rng = new Random();
    var num = rng.nextInt(99);

    String title = "img_$num$formattedDate.jpg";

    Img.Image image = Img.decodeImage(selectImage.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 1280);

    var compressImg = new File("$path/$title")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 95));

    setState(() {
      imageUpload = compressImg;
      filename = basename(imageUpload.path);
      imageType = type;

      print("filename : $filename");
      print("imageType : $imageType");
    });
  }

  _resetState() {
    setState(() {
      imageUpload = null;
      filename = "";
    });
  }

  _showPicker(BuildContext context) {
    showDatePicker(
            context: context,
            firstDate: new DateTime(2017),
            initialDate: selectedYear == null
                ? DateTime.now()
                : DateTime(selectedYear, selectedMonth, selectedDay),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        selectedMonth = dt.month;
        selectedDay = dt.day;
      });
    });
  }

  Future<Null> uploadImage() async {
    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = ref.putFile(imageUpload);

    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = downUrl.toString();

    setState(() {
      imageUpload = null;
      filename = "";
      urlImage = url;
    });

    _saveData(context);
  }

  void _saveData(context) {
    var buildDate = DateTime(selectedYear, selectedMonth, selectedDay);
    var textDate = DateFormat('y-MM-dd').format(buildDate);
    print("ShowDate : $textDate");
    print("Download URL : $urlImage");

    Firestore.instance.runTransaction((Transaction transacion) async {
      CollectionReference reference = Firestore.instance.collection("appfood");
      await reference.add({
        "datetime": textDate,
        "urlfilename": urlImage,
      });
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25.0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 55.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 70.0, 20.0, 0.0),
              child: Text(
                "Photo",
                style: TextStyle(
                  fontSize: 55.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(145.0, 30.0, 20.0, 0.0),
              child: Text(
                ".",
                style: TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.date_range, size: 30.0,),
            _showDateFood(context),
          ],
        ),
        SizedBox(height: 20.0),
        imageUpload == null ? showBtn(_getImage) : showUpload(),
      ],
    );
  }

  Widget showBtn(func) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AddPhoto(titleBtn: "Breakfast", fn: func, type: 1),
            SizedBox(width: 20.0),
            AddPhoto(titleBtn: "Lunch", fn: func, type: 2),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AddPhoto(titleBtn: "Dinner", fn: func, type: 3),
            SizedBox(width: 20.0),
            AddPhoto(titleBtn: "Snack", fn: func, type: 4),
          ],
        )
      ],
    );
  }

  Widget showUpload() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              iconSize: 40.0,
              onPressed: () {
                uploadImage();
              },
              color: Colors.green,
            ),
            IconButton(
                icon: Icon(Icons.close),
                iconSize: 40.0,
                onPressed: () {
                  _resetState();
                },
                color: Colors.redAccent),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Image.file(imageUpload, width: double.infinity),
      ],
    );
  }

  Widget _showDateFood(context) {
    if (selectedYear != null) {
      var buildDate = DateTime(selectedYear, selectedMonth, selectedDay);
      var showDate = DateFormat('d').format(buildDate);
      var showMonth = DateFormat('MMMM').format(buildDate);
      var showYear = DateFormat('y').format(buildDate);
      int year = int.parse(showYear) + 543;

      return FlatButton(
        onPressed: () {
          _showPicker(context);
        },
        child: Text(
          "$showDate $showMonth $year",
          style: TextStyle(fontSize: 25.0),
        ),
      );
    } else {
      return Text("");
    }
  }
}
