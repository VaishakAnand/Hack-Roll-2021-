import 'package:flutterapp/music_objects/artist.dart';

class Track {
  String id;
  String title;
  String artistDisplayName;
  List<Artist> artists;
  String releaseDate;
  String genre;
  String arousal;
  String valence;
  String popularity;
  String favourite;

  Track(
      {this.id,
      this.title,
      this.artistDisplayName,
      this.artists,
      this.releaseDate,
      this.genre,
      this.arousal,
      this.valence,
      this.popularity,
      this.favourite});

  factory Track.fromJson(Map<String, dynamic> parsedJson) {
    return Track(
        id: parsedJson['id'],
        title: parsedJson['title'],
        artistDisplayName: parsedJson['artist_display_name'],
        artists: parsedJson['artists'],
        releaseDate: parsedJson['releasedate'],
        genre: parsedJson['genre'],
        arousal: parsedJson['arousal'],
        valence: parsedJson['valence'],
        favourite: parsedJson['favourite']);
  }
}
