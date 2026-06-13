import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:habitly/app/modules/home/models/reminder_data.dart';

import '../constants/app_constants.dart';
import '../utils/helpers/date_time_picker_helper.dart';

/// ================== X [REMAINDER_MIXIN] X ==================
mixin RemainderMixin {
  /// for regular reminder
  final regularReminder = ReminderData(
    initialText: strPleaseSelectReminderTime,
  );

  /// for one-time task
  final oneTimeReminder = ReminderData(
    initialText: strPleaseSelectReminderTime,
  );

  void onReminderChanged(ReminderData reminder, bool value) {
    reminder.isEnabled.value = value;
  }

  void showTimePickerDialog(BuildContext context, ReminderData reminder) async {
    final picked = await DateTimePickerHelper.showTimePickerDialog(context);

    if (picked == null || !context.mounted) {
      reminder.controller.text = strPleaseSelectReminderTime;
      return;
    }

    reminder.controller.text = picked.format(context);
    reminder.hour = picked.hour;
    reminder.minute = picked.minute;
  }
}
