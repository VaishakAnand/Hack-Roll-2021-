import 'package:flutter/material.dart';
import 'package:flutterapp/history/history_tile.dart';
import 'package:flutterapp/utils/data.dart';
import 'package:flutterapp/utils/database.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: futureBuilder,
    );
  }

  Future<List<Data>> _getData() async {
    // DBProvider.db.newData(new Data(
    //     arousalScore: 100, valenceScore: 100, keywords: "sad|happy|angry"));
    List<Data> allData = await DBProvider.db.getAllData();

    return allData;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Data> tiles = snapshot.data;

    List<HistoryTile> historyTiles = List();
    for (var i = 0; i < tiles.length; i++) {
      Data currentData = tiles[i];
      var splitKeywords = currentData.keywords.split("|");
      HistoryTile newTile = HistoryTile(
        valence: currentData.valenceScore,
        arousal: currentData.arousalScore,
        keywords: splitKeywords,
      );

      historyTiles.add(newTile);
    }

    return new ListView.builder(
      itemCount: tiles.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            historyTiles[index],
            // new Divider(
            //   height: 2.0,
            // ),
          ],
        );
      },
    );
  }
}
// <Widget>[
//           HistoryTile(valence: 24, arousal: 30, keywords: s),
//         ],
