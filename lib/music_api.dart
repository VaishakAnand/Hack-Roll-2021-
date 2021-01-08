import 'package:flutter/material.dart';
import 'package:flutterapp/api_management.dart';
import 'music_suggestions.dart';

class Music extends StatefulWidget {
  @override
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  MusicSuggestions _suggestions;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    MusicApi.getSuggestions().then((suggestions) {
      _suggestions = suggestions;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fetching Song suggestions'),
        ),
        body: Center(child: _showDetails()));
  }

  Widget _showDetails() {
    if (_loading) {
      return CircularProgressIndicator();
    } else {
      return Text(_suggestions.tracks.track.isEmpty
          ? "Is Empty"
          : _suggestions.tracks.track[0].artistDisplayName.toString());
    }
  }
}
