import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DashboardPage.dart';
import 'PayoutsPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DashboardPage(),
    PayoutsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      body: _children[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            // title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_stack_3d_up),
            activeIcon: Icon(CupertinoIcons.square_stack_3d_up_fill),
            // title: Text('Profile'),
          )
        ],
      ),
    );
  }
}
