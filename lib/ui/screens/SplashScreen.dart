import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myethermine/ui/widgets/style/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  String _version = 'v 0.9';
  AnimationController animationController;
  Animation animation;

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

    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween(begin: 120.0, end: 150.0).animate(animationController);
    animationController.addStatusListener(animationStatusListener);
    animationController.forward();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 1, 65, 1),
      body: Stack(fit: StackFit.expand, children: [
        BackgroundItemsPageStyle(),
        Column(
          children: [
            Expanded(
              flex: 7,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget child) {
                  final size = animation.value;
                  return Center(
                    child: Image.asset(
                      'assets/img/logo-ethereum.png',
                      alignment: Alignment.centerRight,
                      height: size,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Text(
                'MyEthMiner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                _version,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
