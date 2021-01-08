import 'package:flutterapp/music_objects/music_track.dart';

class MultipleTracks {
  List<Track> tracks;

  MultipleTracks({this.tracks});

  factory MultipleTracks.fromJson(List<dynamic> parsedJson) {
    List<Track> trackList = new List<Track>();

    trackList = parsedJson.map((i) => Track.fromJson(i)).toList();
    return new MultipleTracks(tracks: trackList);
  }
}
