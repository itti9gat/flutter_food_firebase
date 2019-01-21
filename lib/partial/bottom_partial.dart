import 'package:flutter/material.dart';

class BottomPartial extends StatelessWidget {

  BottomPartial({this.func, this.idx});

  final Function func;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: idx,
        onTap: (int index) {
          func(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.grey),
              activeIcon: Icon(Icons.add, color: Colors.green),
              title: Text(
                'ADD',
                style: TextStyle(color: Colors.grey),
              )),
        ],
      );
  }
}
