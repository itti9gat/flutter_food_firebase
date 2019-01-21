import 'package:flutter/material.dart';

void main() => runApp(MyMusic());

class MyMusic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI of => Ganna App',
      home: MyApp(),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     title: 'UI of => Ganna App',
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class AdsImages {
  AdsImages({this.image1});

  String image1;
}


//Please download images from yourside and put in assets/images folder

List<AdsImages> _list = <AdsImages>[
  AdsImages(image1: 'assets/images/a.jpg'),
  AdsImages(image1: 'assets/images/b.jpg'),
  AdsImages(image1: 'assets/images/c.jpg'),
  AdsImages(image1: 'assets/images/d.png')
];

class LMImages {
  LMImages({this.lmimage1});

  String lmimage1;
}

List<LMImages> _lmlist = <LMImages>[
  LMImages(lmimage1: 'assets/images/m1.jpg'),
  LMImages(lmimage1: 'assets/images/m2.jpg'),
  LMImages(lmimage1: 'assets/images/m3.jpg'),
  LMImages(lmimage1: 'assets/images/m4.jpg'),
  LMImages(lmimage1: 'assets/images/m5.jpg'),
  LMImages(lmimage1: 'assets/images/m6.jpg'),
  LMImages(lmimage1: 'assets/images/m7.jpg'),
  LMImages(lmimage1: 'assets/images/m8.jpg'),
  LMImages(lmimage1: 'assets/images/m9.jpg'),
];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: <Widget>[
           IconButton(
            onPressed: () {},
            icon: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  left: 14.0,
                  child: Icon(Icons.brightness_1,
                  size: 12.0,
                  color: Colors.red,),
                )
              ],
            )
            
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              //    color: Colors.grey,
            ),
          ),
         
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 100.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //i have already download some icons for this ads & pictures for movies
                  itemCount: _list.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return Container(
                      height: 50.0,
                      width: 100.0,
                      child: Card(
                        child: Image.asset(_list[index].image1,
                        fit: BoxFit.fill,),
                      ),
                    );
                  },
                )
              ,
              ),
              SizedBox(height: 10.0),
              Column(
                children: <Widget>[
                  Container(
                    height: 170.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _lmlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 120.0,
                          width: 300.0,
                          child: Card(
                            child: Image.asset(_lmlist[index].lmimage1,
                            fit: BoxFit.fill,),
                          ),
                        );
                      },
                    )
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Recently Played',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(width: 30.0),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    child: FlatButton(
                    onPressed: () {}, 
                    child: Text('VIEW ALL'),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  )
                ],
              ),
               SizedBox(height: 10.0),
               Column(
                 children: <Widget>[
                   Container(
                     height: 100.0,
                     child: ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: _lmlist.length,
                       itemBuilder: (BuildContext context, int index) {
                         return Container(
                           height: 50.0,
                           width: 90.0,
                           child: Card(
                             child: Image.asset(_lmlist[index].lmimage1,
                             fit: BoxFit.fill),
                           ),
                         );
                       },
                     ),
                   )
                 ],
               ),
               SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Trending Songs',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(width: 30.0),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    child: FlatButton(
                    onPressed: () {}, 
                    child: Text('VIEW ALL'),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        //as current indo is 0, icon has activated title
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: Colors.grey),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.share,
            color: Colors.grey),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search,
            color: Colors.grey),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.radio,
            color: Colors.grey),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey
            ),)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.library_music,
            color: Colors.grey),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey
            ),)
          ),
        ],
      ),
    );
  }
}