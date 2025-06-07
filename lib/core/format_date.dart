import 'package:intl/intl.dart';

String formatDayAndDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('EE, MMMM d, y');
  return formatter.format(dateTime);
}
