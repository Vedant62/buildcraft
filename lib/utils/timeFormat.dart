import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final hours = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
  final period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
  final minutes = timeOfDay.minute.toString().padLeft(2, '0');

  return "$hours:$minutes $period";
}
