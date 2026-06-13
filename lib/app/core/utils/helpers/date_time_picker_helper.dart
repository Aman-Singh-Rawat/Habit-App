import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimePickerHelper {
  DateTimePickerHelper._();

  static Future<TimeOfDay?> showTimePickerDialog(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
