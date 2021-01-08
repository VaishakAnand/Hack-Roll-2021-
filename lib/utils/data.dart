class Data {
  final int id;
  final int dateTime;
  final int arousalScore;
  final int valenceScore;
  final String keywords;
  final String songName;
  final String artistName;
  final String genre;
  final String releaseYear;

  Data(
      {this.id,
      this.dateTime,
      this.arousalScore,
      this.valenceScore,
      this.keywords,
      this.songName,
      this.artistName,
      this.genre,
      this.releaseYear});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'datetime': dateTime,
      'arousal': arousalScore,
      'valence': valenceScore,
      'keywords': keywords,
      'songname': songName,
      'artistname': artistName,
      'genre': genre,
      'releaseyear': releaseYear
    };
  }
}
