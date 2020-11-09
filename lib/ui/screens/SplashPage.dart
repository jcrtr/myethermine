import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String _version = 'v 0.9';

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, '/intro');
    }
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, checkFirstSeen);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 1, 65, 1),
      body: Stack(fit: StackFit.expand, children: [
        Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Image.asset(
                  'assets/img/logo-ethereum.png',
                  alignment: Alignment.centerRight,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: Text(
                _version,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
