import 'package:flutter/material.dart';
import 'package:flutterapp/speech_to_text.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Moodsicle',
        ),
        centerTitle: true,
      ),
      body: SpeechScreen(),
    );
  }
}
