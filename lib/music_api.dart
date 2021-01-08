import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/music_objects/api_music_suggestions.dart';
import 'package:http/http.dart' as http;

class Music extends StatefulWidget {
  @override
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  Future<MusicSuggestions> futureMusic;

  @override
  void initState() {
    super.initState();
    futureMusic = fetchMusicSuggestions();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetching Song suggestions'),
      ),
      body: Center(
        child: FutureBuilder<MusicSuggestions>(
          future: futureMusic,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.request.listenercountry);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<MusicSuggestions> fetchMusicSuggestions() async {
  final response = await http.get(
      'http://musicovery.com/api/V6/playlist.php?&fct=getfrommood&popularitymax=100&popularitymin=50&starttrackid=&date70=true&trackvalence=900000&trackarousal=100000&resultsnumber=15&listenercountry=es');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MusicSuggestions.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load music suggestions');
  }
}
