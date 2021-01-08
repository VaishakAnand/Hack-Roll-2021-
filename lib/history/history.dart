import 'package:flutter/material.dart';
import 'package:flutterapp/history/history_tile.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    List<String> s = ["abc", "efg"]; // sample data
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          HistoryTile(valence: 24, arousal: 30, keywords: s),
        ],
      ),
    );
  }
}