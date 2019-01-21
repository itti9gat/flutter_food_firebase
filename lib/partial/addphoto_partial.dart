import 'package:flutter/material.dart';

class AddPhoto extends StatelessWidget {

  AddPhoto({this.titleBtn, this.fn, this.type});

  final String titleBtn;
  final Function fn;
  final int type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            fn(type);
          },
          child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_a_photo,
                    color: Colors.grey[500],
                    size: 50.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    titleBtn,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ),
    );
  }
}
