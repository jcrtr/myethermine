import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myethermine/ui/screens/SettingsScreen.dart';

import 'DashboardScreen.dart';
import 'PayoutsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DashboardScreen(),
    PayoutsScreen(),
    SettingScreen(),
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
      // backgroundColor: CupertinoColors.secondarySystemBackground,
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
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            activeIcon: Icon(CupertinoIcons.settings_solid),
            // title: Text('Profile'),
          )
        ],
      ),
    );
  }
}
