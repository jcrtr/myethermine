import 'package:flutter/material.dart';

class BackgroundItemsPageStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * .12,
          left: -5,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .16,
          left: MediaQuery.of(context).size.width * 0.05,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .1,
          left: 65,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .05,
          right: 30,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .09,
          right: -15,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .09,
          right: 65,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
