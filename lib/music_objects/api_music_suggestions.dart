import 'package:flutterapp/music_objects/music_info.dart';
import 'package:flutterapp/music_objects/music_multiple_tracks.dart';
import 'package:flutterapp/music_objects/music_request.dart';
import 'package:flutterapp/music_objects/music_response.dart';

class MusicSuggestions {
  Request request;
  Response response;
  Info infos;
  MultipleTracks tracks;
  String played;
  Map favonot;

  MusicSuggestions(
      {this.request,
      this.response,
      this.infos,
      this.tracks,
      this.played,
      this.favonot});

  factory MusicSuggestions.fromJson(Map<String, dynamic> parsedJson) {
    return MusicSuggestions(
        request: parsedJson['request'],
        response: parsedJson['response'],
        infos: parsedJson['infos'],
        tracks: parsedJson['tracks'],
        played: parsedJson['played'],
        favonot: parsedJson['favonot']);
  }
}
