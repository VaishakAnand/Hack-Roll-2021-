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
          title: Text('Here are your music suggestions'),
        ),
        body: Center(child: _showDetails()));
  }

  Widget _showDetails() {
    if (_loading) {
      return CircularProgressIndicator();
    } else if (_suggestions.tracks.track.isEmpty) {
      return Text("No Suggestions to make, please try again later");
    } else {
      String songName = _suggestions.tracks.track[0].title;
      String artistName = _suggestions.tracks.track[0].artistDisplayName;
      String genre = _suggestions.tracks.track[0].genre;
      String releaseYear = _suggestions.tracks.track[0].releasedate;
      return Text(
        "Name: $songName\nArtist: $artistName\nRelease Year: $releaseYear\nGenre: $genre",
        style: TextStyle(fontSize: 20),
      );
    }
  }
}
