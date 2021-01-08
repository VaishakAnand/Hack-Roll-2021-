class Data {
  final int id;
  final int dateTime;
  final int arousalScore;
  final int valenceScore;

  Data({this.id, this.dateTime, this.arousalScore, this.valenceScore});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'datetime': dateTime,
      'arousal': arousalScore,
      'valence': valenceScore,
    };
  }
}
