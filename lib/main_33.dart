import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What I ate',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Redmi(),
    );
  }
}

class Redmi extends StatefulWidget {
  @override
  _RedmiState createState() => _RedmiState();
}

class _RedmiState extends State<Redmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80.0),
                bottomLeft: Radius.circular(80.0)),
            child: Container(
              color: Colors.orange[200],
              height: 290.0,
            ),
          ),
          Positioned(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          debugPrint('Settings');
                        },
                        icon: Icon(
                          Icons.settings_input_svideo,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          debugPrint('message');
                        },
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        children: <Widget>[
                          Text(
                            '2020000',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.person,
                                  color: Colors.white, size: 15.0),
                              SizedBox(width: 5.0),
                              Text(
                                'Silver',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_right,
                                  color: Colors.white, size: 18.0),
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 140.0),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)),
                        child: Container(
                          color: Colors.white,
                          height: 50.0,
                          width: 130.0,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5.0,
                              ),
                              Material(
                                color: Colors.orange[200],
                                elevation: 0.0,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Center(
                                    child: Text('Mi',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '49',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                   Text(
                                    'Mi Tokens',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                 
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      height: 200.0,
                      width: 380.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Orders',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                SizedBox(width: 200.0),
                                Text(
                                  'All Orders',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey[500],
                                )
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: 350.0,
                              child: Center(
                                child: Divider(color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.markunread_mailbox,
                                        size: 40.0, color: Colors.orange[400]),
                                    SizedBox(height: 8.0),
                                    Text('Unpaid',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.local_shipping,
                                        size: 40.0, color: Colors.orange[400]),
                                    SizedBox(height: 8.0),
                                    Text('Shipping',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.assignment_return,
                                        size: 40.0, color: Colors.orange[400]),
                                    SizedBox(height: 8.0),
                                    Text('Returns',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.rate_review,
                                      size: 40.0,
                                      color: Colors.orange[400],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Reviews',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0))
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(height: 20.0),
                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 220.0,
                    width: 380.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Support',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: 320.0,
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue[400],
                                    child: Icon(Icons.headset,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Online Help',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    child: Icon(Icons.headset,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Redward Mi',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue[400],
                                    child: Icon(Icons.cloud_queue,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Mi VIP Club',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.pink[400],
                                    child: Icon(Icons.explicit,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Exchange',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              )
                            ],
                          ),
                           SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue[200],
                                    child: Icon(Icons.attach_money,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Cardless EMI',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.pink[200],
                                    child: Icon(Icons.card_giftcard,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Gift Card',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.orange[400],
                                    child: Icon(Icons.golf_course,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Counps',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.green[400],
                                    child: Icon(Icons.card_membership,
                                    color: Colors.white),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Saved Card',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
       // currentIndex: 3,
        fixedColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: Colors.grey[600],),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey[600]
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.category,
            color: Colors.grey[600],),
            title: Text('Category',
            style: TextStyle(
              color: Colors.grey[600]
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: Colors.grey[600],),
            title: Text('Discover',
            style: TextStyle(
              color: Colors.grey[600]
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person,
            color: Colors.grey[600],),
            title: Text('Account',
            style: TextStyle(
              color: Colors.grey[600]
            ),)
          ),
        ],
      ),
    );
  }
}