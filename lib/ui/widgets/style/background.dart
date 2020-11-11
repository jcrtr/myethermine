import 'package:flutter/material.dart';

import 'background_item.dart';
import 'clipper.dart';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  bool _isDark;

  @override
  Widget build(BuildContext context) {
    var _darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    if (_darkMode) {
      _isDark = true;
    } else {
      _isDark = false;
    }
    return _isDark == false
        ? ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                // color: Color.fromRGBO(25, 1, 65, 1),
                gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.amberAccent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment(0.8, 0.6),
                ),
              ),
              child: BackgroundItem(),
            ),
          )
        : ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Color.fromRGBO(25, 1, 65, 1),
              ),
              child: BackgroundItem(),
            ),
          );
  }
}
