import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FoodImages {
  FoodImages({this.imgname});

  String imgname;
}

List<FoodImages> _lmlist = <FoodImages>[
  FoodImages(imgname: 'assets/images/img01.jpg'),
  FoodImages(imgname: 'assets/images/img02.jpg'),
  FoodImages(imgname: 'assets/images/img03.jpg'),
  FoodImages(imgname: 'assets/images/img04.jpg'),
  FoodImages(imgname: 'assets/images/img05.jpg'),
  FoodImages(imgname: 'assets/images/img06.jpg'),
  FoodImages(imgname: 'assets/images/img07.jpg'),
  FoodImages(imgname: 'assets/images/img08.jpg'),
];

List<DateTime> _datetime = [];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('appfood').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading...");
        } else {
          var documents = snapshot.data.documents;

          var startDate = DateTime.parse(documents[0]["datetime"]);

          for (var i = 0; i >= -6; i--) {
              _datetime.add(startDate.add(new Duration(days: i)));
          }

          return ListView(
            padding: EdgeInsets.all(25.0),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                    child: Text(
                      "What",
                      style: TextStyle(
                          fontSize: 55.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 70.0, 20.0, 0.0),
                    child: Text(
                      "I Ate",
                      style: TextStyle(
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(115.0, 30.0, 20.0, 0.0),
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
              Container(
                width: 500.0,
                height: 500.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _datetime.length,
                  itemBuilder: (BuildContext context, int index) {

                    var dayEach = _datetime[index];
                    var dayWeek = DateFormat.EEEE().format(dayEach);
                    var dayShow = DateFormat.yMMMMd().format(dayEach);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dayWeek.toString(),
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          dayShow.toString(),
                          style: TextStyle(
                              fontSize: 19.0, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                            height: 200.0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 15.0),
                                  height: 120.0,
                                  width: 250.0,
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.all(new Radius.circular(15.0)),
                                    image: new DecorationImage(
                                      image: new NetworkImage(
                                          documents[index]["urlfilename"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            )),
                            SizedBox(height: 30.0),
                      ],
                    );
                  },
                ),
              ),
              Text(
                "Sunday",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
              ),
              Text(
                "6 January 2019",
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              Container(
                  height: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15.0),
                        height: 120.0,
                        width: 250.0,
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                          image: new DecorationImage(
                            image: new NetworkImage(
                                documents[index]["urlfilename"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )),
              SizedBox(height: 40.0),
              Text(
                "Saturday",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
              ),
              Text(
                "5 January 2019",
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              Container(
                  height: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _lmlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15.0),
                        height: 120.0,
                        width: 250.0,
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                          image: new DecorationImage(
                            image: new AssetImage(_lmlist[index].imgname),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )),
            ],
          );
        }
      },
    );
  }
}
