class Date {
  DateTime dateTime;

  Date({
    this.dateTime,
  });

  int getDatabaseFormat() {
    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime getDateFromDatabase(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }
}
