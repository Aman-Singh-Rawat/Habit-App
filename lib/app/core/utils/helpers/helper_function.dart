import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:table_calendar/table_calendar.dart';

class AHelperFunction {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static void showMessage(String title, String message) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  static Color stringToColor(String colorString) {
    return Color(int.parse(colorString, radix: 16));
  }

  static DateTime stripTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static bool containsToday(List<DateTime> dates, DateTime today) {
    return dates.any(
      (d) =>
          d.year == today.year && d.month == today.month && d.day == today.day,
    );
  }
}
