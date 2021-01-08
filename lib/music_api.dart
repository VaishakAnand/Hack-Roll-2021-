import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Music extends StatefulWidget {
  @override
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  List list = List();
  var isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold();
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {
      list = json.decode(response.body) as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
