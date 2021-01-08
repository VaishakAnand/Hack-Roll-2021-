class Response {
  String code;
  String anwser;
  String time;

  Response({this.code, this.anwser, this.time});

  factory Response.fromJson(Map<String, dynamic> parsedJson) {
    return Response(
        code: parsedJson['code'],
        anwser: parsedJson['anwser'],
        time: parsedJson['time']);
  }
}
