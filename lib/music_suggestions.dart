// To parse this JSON data, do
//
//     final musicSuggestions = musicSuggestionsFromJson(jsonString);

import 'dart:convert';

MusicSuggestions musicSuggestionsFromJson(String str) =>
    MusicSuggestions.fromJson(json.decode(str));

String musicSuggestionsToJson(MusicSuggestions data) =>
    json.encode(data.toJson());

class MusicSuggestions {
  MusicSuggestions({
    this.request,
    this.response,
    this.infos,
    this.tracks,
    this.played,
    this.favonot,
  });

  Request request;
  Response response;
  Infos infos;
  Tracks tracks;
  String played;
  Favonot favonot;

  factory MusicSuggestions.fromJson(Map<String, dynamic> json) =>
      MusicSuggestions(
        request: Request.fromJson(json["request"]),
        response: Response.fromJson(json["response"]),
        infos: Infos.fromJson(json["infos"]),
        tracks: Tracks.fromJson(json["tracks"]),
        played: json["played"],
        favonot: Favonot.fromJson(json["favonot"]),
      );

  Map<String, dynamic> toJson() => {
        "request": request.toJson(),
        "response": response.toJson(),
        "infos": infos.toJson(),
        "tracks": tracks.toJson(),
        "played": played,
        "favonot": favonot.toJson(),
      };
}

class Favonot {
  Favonot();

  factory Favonot.fromJson(Map<String, dynamic> json) => Favonot();

  Map<String, dynamic> toJson() => {};
}

class Infos {
  Infos({
    this.id,
    this.radioName,
    this.radioType,
  });

  Favonot id;
  Favonot radioName;
  Favonot radioType;

  factory Infos.fromJson(Map<String, dynamic> json) => Infos(
        id: Favonot.fromJson(json["id"]),
        radioName: Favonot.fromJson(json["radio_name"]),
        radioType: Favonot.fromJson(json["radio_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toJson(),
        "radio_name": radioName.toJson(),
        "radio_type": radioType.toJson(),
      };
}

class Request {
  Request({
    this.fct,
    this.popularitymax,
    this.popularitymin,
    this.starttrackid,
    this.date70,
    this.trackvalence,
    this.trackarousal,
    this.resultsnumber,
    this.listenercountry,
  });

  String fct;
  String popularitymax;
  String popularitymin;
  Favonot starttrackid;
  String date70;
  String trackvalence;
  String trackarousal;
  String resultsnumber;
  String listenercountry;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        fct: json["fct"],
        popularitymax: json["popularitymax"],
        popularitymin: json["popularitymin"],
        starttrackid: Favonot.fromJson(json["starttrackid"]),
        date70: json["date70"],
        trackvalence: json["trackvalence"],
        trackarousal: json["trackarousal"],
        resultsnumber: json["resultsnumber"],
        listenercountry: json["listenercountry"],
      );

  Map<String, dynamic> toJson() => {
        "fct": fct,
        "popularitymax": popularitymax,
        "popularitymin": popularitymin,
        "starttrackid": starttrackid.toJson(),
        "date70": date70,
        "trackvalence": trackvalence,
        "trackarousal": trackarousal,
        "resultsnumber": resultsnumber,
        "listenercountry": listenercountry,
      };
}

class Response {
  Response({
    this.code,
    this.anwser,
    this.time,
  });

  String code;
  String anwser;
  String time;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        anwser: json["anwser"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "anwser": anwser,
        "time": time,
      };
}

class Tracks {
  Tracks({
    this.track,
  });

  List<Track> track;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
      };
}

class Track {
  Track({
    this.id,
    this.title,
    this.artistDisplayName,
    this.artists,
    this.releasedate,
    this.genre,
    this.arousal,
    this.valence,
    this.popularity,
    this.favorite,
  });

  String id;
  String title;
  String artistDisplayName;
  Artists artists;
  String releasedate;
  String genre;
  String arousal;
  String valence;
  String popularity;
  String favorite;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        title: json["title"],
        artistDisplayName: json["artist_display_name"],
        artists: Artists.fromJson(json["artists"]),
        releasedate: json["releasedate"],
        genre: json["genre"],
        arousal: json["arousal"],
        valence: json["valence"],
        popularity: json["popularity"],
        favorite: json["favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "artist_display_name": artistDisplayName,
        "artists": artists.toJson(),
        "releasedate": releasedate,
        "genre": genre,
        "arousal": arousal,
        "valence": valence,
        "popularity": popularity,
        "favorite": favorite,
      };
}

class Artists {
  Artists({
    this.artist,
  });

  Artist artist;

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        artist: Artist.fromJson(json["artist"]),
      );

  Map<String, dynamic> toJson() => {
        "artist": artist.toJson(),
      };
}

class Artist {
  Artist({
    this.mbid,
    this.name,
    this.genre,
  });

  String mbid;
  String name;
  String genre;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        mbid: json["mbid"],
        name: json["name"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "mbid": mbid,
        "name": name,
        "genre": genre,
      };
}
