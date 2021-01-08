class Artist {
  String mbid;
  String name;
  String genre;

  Artist({this.mbid, this.name, this.genre});

  factory Artist.fromJson(Map<String, dynamic> parsedJson) {
    return Artist(
        mbid: parsedJson['mbid'],
        name: parsedJson['name'],
        genre: parsedJson['genre']);
  }
}
