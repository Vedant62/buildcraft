import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

String formatDateClean(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM');
  return formatter.format(date);
}
