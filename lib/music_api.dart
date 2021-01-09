import 'package:flutter/material.dart';
import 'package:flutterapp/api_management.dart';
import 'package:flutterapp/bottom_button.dart';
import 'package:flutterapp/results_card.dart';
import 'package:flutterapp/utils/data.dart';
import 'package:flutterapp/utils/database.dart';

import 'date.dart';
import 'music_suggestions.dart';
import 'sentiment_score.dart';
import 'constants.dart';

class Music extends StatefulWidget {
  String userInputText;

  Music({@required this.userInputText});

  @override
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  MusicSuggestions _suggestions;
  bool _loading;
  SentimentScore sentimentScore;
  MusicApi musicApi;

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
    await musicApi.getSuggestions().then((suggestions) {
      setState(() {
        _suggestions = suggestions;
      });
    }).then((value) => setState(() {
          _loading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _showDetails()));
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

  void _updateDatabase(
      String songName, String artistName, String genre, String releaseYear) {
    DateTime currentTime = DateTime.now();
    int currentTimeToSave = Date(dateTime: currentTime).getDatabaseFormat();
    int valence = sentimentScore.getValenceScore();
    int arousal = sentimentScore.getArousalScore();
    List<String> keywordsToMerge = sentimentScore.getKeywords();
    String mergedKeywords = "";
    for (int i = 0; i < keywordsToMerge.length; i++) {
      String toAddDivider = keywordsToMerge[i] + "|";
      mergedKeywords = mergedKeywords + toAddDivider;
    }

    Data dataToSave = Data(
      dateTime: currentTimeToSave,
      valenceScore: valence,
      arousalScore: arousal,
      keywords: mergedKeywords,
      songName: songName,
      artistName: artistName,
      genre: genre,
      releaseYear: releaseYear,
    );

    DBProvider.db.newData(dataToSave);
  }
}
