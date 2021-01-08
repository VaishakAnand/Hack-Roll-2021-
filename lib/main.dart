import 'package:flutter/material.dart';
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
        primaryColor: Color(0xFF1eae50),
        scaffoldBackgroundColor: Color(0xFF0d2620),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}
