import 'package:flutter/material.dart';
import 'package:flutterapp/api_management.dart';
import 'package:flutterapp/bottom_button.dart';
import 'package:flutterapp/results_card.dart';
import 'music_suggestions.dart';
import 'sentiment_score.dart';
import 'constants.dart';

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
    sentimentScore = SentimentScore(widget.userInputText);
    musicApi = MusicApi(
        valence: sentimentScore.getValenceScore(),
        arousal: sentimentScore.getArousalScore());
    _initialLoad();
  }

  void _initialLoad() async {
    await MusicApi.getSuggestions().then((suggestions) {
      setState(() {
        _suggestions = suggestions;
      });
    }).then((value) => setState(() {
      _loading = false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Here are your music suggestions'),
        // ),
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
      // return Text(
      //   "Name: $songName\nArtist: $artistName\nRelease Year: $releaseYear\nGenre: $genre",
      //   style: TextStyle(fontSize: 20),
      // );
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Here are your music suggestions',
                  style: kBodyTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ResultsCard(
                colour: kCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      artistName.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      songName,
                      style: kSongTextStyle,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          genre,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          releaseYear,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'TRY A DIFFERENT MOOD',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutterapp/sentiment_score.dart';
// import 'api_management.dart';
// import 'music_suggestions.dart';

// class Music extends StatefulWidget {
//   @override
//   MusicState createState() => MusicState();
// }

// class MusicState extends State<Music> {
//   MusicState({this.moodText}) {
//     sentimentScore = SentimentScore(moodText);
//     musicApi = MusicApi(
//         valence: sentimentScore.getValenceScore(),
//         arousal: sentimentScore.getArousalScore());
//   }

//   String moodText;
//   SentimentScore sentimentScore;
//   MusicApi musicApi;

//   MusicSuggestions _suggestions;
//   bool _loading;

//   String songName;
//   String artistName;
//   String releaseYear;
//   String genre;

//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     musicApi.getSuggestions().then((suggestions) {
//       _suggestions = suggestions;
//       _loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Here are your music suggestions'),
//         ),
//         body: Center(child: _showDetails()));
//   }

//   Widget _showDetails() {
//     if (_loading) {
//       return CircularProgressIndicator();
//     } else if (_suggestions.tracks.track.isEmpty) {
//       return Text("No Suggestions to make, please try again later");
//     } else {
//       songName = _suggestions.tracks.track[0].title;
//       artistName = _suggestions.tracks.track[0].artistDisplayName;
//       genre = _suggestions.tracks.track[0].genre;
//       releaseYear = _suggestions.tracks.track[0].releasedate;
//       return Text(
//         "Name: $songName\nArtist: $artistName\nRelease Year: $releaseYear\nGenre: $genre",
//         style: TextStyle(fontSize: 20),
//       );
//     }
//   }

//   String getSongName() {
//     return songName;
//   }

//   String getArtistName() {
//     return artistName;
//   }

//   String getReleaseYear() {
//     return releaseYear;
//   }

//   String getGenre() {
//     return genre;
//   }
// }
