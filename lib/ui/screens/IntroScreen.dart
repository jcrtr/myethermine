import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          // image: Image.asset("images/livedemo.png"),
          title: "Live Demo page 1",
          body: "Welcome to Proto Coders Point",
          footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          )),
      PageViewModel(
        // image: Image.asset("images/visueldemo.png"),
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        // image: Image.asset("images/demo3.png"),
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        // image: Image.asset("images/demo4.png"),
        title: "Live Demo page 4 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introduction Screen"),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        done: Text("Got it "),
        onDone: () {},
      ),
    );
  }
}
