import 'package:get/get.dart';

class PreferenceController extends GetxController {
  final RxBool isDailyReminder = false.obs;
  final RxBool isVacationMode = false.obs;

  void onDailyReminderChange(bool value) {
    isDailyReminder.value = value;
  }

  void onVacationModeChange(bool value) {
    isVacationMode.value = value;
  }
}
