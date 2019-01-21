import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/add_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What I ate',
      theme: ThemeData(
        primarySwatch: Colors.green,
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

  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    AddPage(),
    HomePage()
  ];

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.green),
              title: Text(
                'Home',
                style: TextStyle(
                  color: _currentIndex == 0 ? Colors.green : Colors.grey,
                  fontWeight: _currentIndex == 0 ? FontWeight.bold : FontWeight.normal,
                )
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.grey),
              activeIcon: Icon(Icons.add, color: Colors.green),
              title: Text(
                'ADD',
                style: TextStyle(
                  color: _currentIndex == 1 ? Colors.green : Colors.grey,
                  fontWeight: _currentIndex == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.line_style, color: Colors.grey),
              activeIcon: Icon(Icons.line_style, color: Colors.green),
              title: Text(
                'List',
                style: TextStyle(color: Colors.grey),
              )),
        ],
      )
    );
  }
}
