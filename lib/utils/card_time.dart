String cFormatTime(DateTime dateTime) {
  int hour = dateTime.hour;
  String period = hour >= 12 ? "pm" : "am";
  hour = hour % 12 == 0 ? 12 : hour % 12; // Converts to 12-hour format, ensuring 12:00 instead of 0:00.
  String minute = dateTime.minute.toString().padLeft(2, '0');
  return "$hour:$minute $period";
}