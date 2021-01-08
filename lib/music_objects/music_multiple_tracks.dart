import 'package:flutterapp/music_objects/music_track.dart';

class MultipleTracks {
  List<Track> tracks;

  MultipleTracks({this.tracks});

  factory MultipleTracks.fromJson(Map<String, dynamic> parsedJson) {
    return MultipleTracks(tracks: parsedJson['track']);
  }
}
