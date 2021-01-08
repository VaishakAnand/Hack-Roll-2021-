class Date {
  DateTime dateTime;

  Date({
    this.dateTime,
  });

  int getDatabaseFormat() {
    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime getDateFromDatabase(int date) {
    print("extracting date:   " + date.toString());
    return DateTime.fromMillisecondsSinceEpoch(date);
  }
}
