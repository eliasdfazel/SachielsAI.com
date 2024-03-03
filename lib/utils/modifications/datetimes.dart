String formatDateTime(int milliseconds) {

  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

  return "${dateTime.month}.${dateTime.day}.${dateTime.year}";
}