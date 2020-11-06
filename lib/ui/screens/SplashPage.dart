import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushNamed(context, '/home');
    } else {
      prefs.setBool('seen', true);
      Navigator.pushNamed(context, '/intro');
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25,1,65,1),
      body: Container(
        child: Center(
          child: SvgPicture.asset(
            'assets/img/ethereum-logo.svg',
            alignment: Alignment.centerRight,
            height: 130,
          ),
        ),
      ),
    );
  }
}
