import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';

class ReminderData {
  final RxBool isEnabled = false.obs;

  int? hour;
  int? minute;

  final TextEditingController controller;

  ReminderData({
    String initialText = strPleaseSelectReminderTime,
  }) : controller = TextEditingController(text: initialText);

  bool get isTimeMissing =>
      isEnabled.value && (hour == null || minute == null);

  void reset() {
    hour = null;
    minute = null;
    controller.text = strPleaseSelectReminderTime;
  }
}
