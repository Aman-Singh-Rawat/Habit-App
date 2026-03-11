import 'package:intl/intl.dart';

class DateClass {
  static String formatMonthDayYear(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  static String formatMonthYear(DateTime date) {
    return DateFormat('MMMM  yyyy').format(date);
  }
}
