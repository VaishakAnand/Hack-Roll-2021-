class Info {
  String id;
  Map radioName;
  Map radioType;

  Info({this.id, this.radioName, this.radioType});

  factory Info.fromJson(Map<String, dynamic> parsedJson) {
    return Info(
        id: parsedJson['id'],
        radioName: parsedJson['radio_name'],
        radioType: parsedJson['radio_type']);
  }
}
