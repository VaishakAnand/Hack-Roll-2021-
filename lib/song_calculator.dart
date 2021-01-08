// import 'package:flutter/cupertino.dart';
// import 'package:flutterapp/api_management.dart';
// import 'package:flutterapp/music_suggestions.dart';
// import 'package:flutterapp/sentiment_score.dart';

// class SongCalculator {
//   SongCalculator({@required this.moodText}) {
//     _sentimentScore = SentimentScore(moodText);
//     _musicApi = MusicApi(
//         valence: _sentimentScore.getValenceScore(),
//         arousal: _sentimentScore.getArousalScore());
//   }

//   String moodText;
//   SentimentScore _sentimentScore;
//   MusicApi _musicApi;
//   MusicSuggestions _suggestions;

//   String _songName;
//   String _artistName;
//   String _releaseYear;
//   String _genre;

//   void loadMusicSuggestions() {
//     _musicApi.getSuggestions().then((suggestions) {
//       _suggestions = suggestions;
//     });
//   }

//   void getSongDetails() {
//     loadMusicSuggestions();
//     if (_suggestions.tracks.track.isEmpty) {
//       // return Text("No Suggestions to make, please try again later");
//       // print("No Suggestions to make, please try again later");
//       _genre = 'testing';
//     } else {
//       _songName = _suggestions.tracks.track[0].title;
//       _artistName = _suggestions.tracks.track[0].artistDisplayName;
//       _genre = _suggestions.tracks.track[0].genre;
//       _releaseYear = _suggestions.tracks.track[0].releasedate;
//     }
//   }

//   String getSongName() {
//     return _songName;
//   }

//   String getArtistName() {
//     return _artistName;
//   }

//   String getReleaseYear() {
//     return _releaseYear;
//   }

//   String getGenre() {
//     return _genre;
//   }
// }
