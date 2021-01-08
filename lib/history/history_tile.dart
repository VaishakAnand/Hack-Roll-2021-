import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

class HistoryTile extends StatefulWidget {
//  final DateTime dateTime;
  final int valence;
  final int arousal;
  final List<String> keywords;

  @override
  _HistoryTileState createState() => _HistoryTileState();

//  HistoryTile({this.dateTime, this.valence, this.arousal, this.keywords});
  HistoryTile({this.valence, this.arousal, this.keywords});
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("test"),
        subtitle: _buildContent(),
      ),
      color: Colors.black38,
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Valence: " + widget.valence.toString()),
            Text("Arousal: " + widget.arousal.toString()),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Tags(
            alignment: WrapAlignment.start,
            itemCount: widget.keywords.length, // required
            itemBuilder: (int index) {
              final item = widget.keywords[index];
              return ItemTags(
                // Each ItemTags must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(index.toString()),
                index: index,
                // required
                title: item,
                pressEnabled: false,
                combine: ItemTagsCombine.withTextBefore,
              );
            })
      ],
    );
  }
}
