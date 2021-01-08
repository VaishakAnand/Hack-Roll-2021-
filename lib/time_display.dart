import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutterapp/constants.dart';

DateTime now = DateTime.now();
DateTime midnight = DateTime(now.year, now.month, now.day);
DateTime noon = DateTime(now.year, now.month, now.day, 12);
DateTime evening = DateTime(now.year, now.month, now.day, 19);
DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1);

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  DateTime _currentTime;

  @override
  void initState() {
    _currentTime = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _getGreetingTime(),
        style: kGreetingTextStyle,
      ),
    );
  }

  void _getCurrentTime() {
    if (mounted) {
      setState(() {
        _currentTime = DateTime.now();
      });
    }
  }

  String _getGreetingTime() {
    String greeting;

    if (_currentTime.isAtSameMomentAs(midnight) ||
        (_currentTime.isAfter(midnight) && _currentTime.isBefore(noon))) {
      greeting = 'Morning';
    } else if (_currentTime.isAtSameMomentAs(noon) ||
        (_currentTime.isAfter(noon) && _currentTime.isBefore(evening))) {
      greeting = 'Afternoon';
    } else if (_currentTime.isAtSameMomentAs(evening) ||
        (_currentTime.isAfter(evening) &&
            _currentTime.isBefore(nextMidnight))) {
      greeting = 'Evening';
    }

    return 'Good $greeting';
  }
}
