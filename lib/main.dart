import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Away',
      theme: ThemeData.dark().copyWith(
        primaryColor: kAppBarColour,
        scaffoldBackgroundColor: kBackgroundColour,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
