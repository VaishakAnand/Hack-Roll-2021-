class Request {
  String fct;
  String popularitymax;
  String popularitymin;
  String starttrackid;
  String date70;
  String trackvalence;
  String trackarousal;
  String resultsnumber;
  String listenercountry;

  Request(
      {this.fct,
      this.popularitymax,
      this.popularitymin,
      this.starttrackid,
      this.date70,
      this.trackvalence,
      this.trackarousal,
      this.resultsnumber,
      this.listenercountry});

  factory Request.fromJson(Map<String, dynamic> parsedJson) {
    return Request(
        fct: parsedJson['fct'],
        popularitymax: parsedJson['popularitymax'],
        popularitymin: parsedJson['popularitymin'],
        starttrackid: parsedJson['starttrackid'],
        date70: parsedJson['date70'],
        trackvalence: parsedJson['trackvalence'],
        trackarousal: parsedJson['trackarousal'],
        resultsnumber: parsedJson['resultsnumber'],
        listenercountry: parsedJson['listenercountry']);
  }
}
