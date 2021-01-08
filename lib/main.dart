import 'package:flutter/material.dart';
import 'package:flutterapp/music_api.dart';
import 'landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Away',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF22C95C),
        scaffoldBackgroundColor: Color(0xFF143930),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LandingPage(),
      home: Music(),
    );
  }
}
