import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/app_constants.dart';
import '../utils/helpers/DateClass.dart';

/// ================== X [END_HABIT] X ==================
mixin EndHabitMixin {
  /// for switch
  final RxBool isEndHabitOn = false.obs;

  /// date or days
  final RxInt selectedEndHabitIndex = 0.obs;

  /// text field where date is selecting
  final endHabitDatePickerController = TextEditingController();

  final Rx<DateTime> endHabitFocusedDay = DateTime.now().obs;
  Rx<DateTime?> endHabitSelectedDate = Rx<DateTime?>(null);

  bool get isEndDateMissing =>
      isEndHabitOn.value && endHabitSelectedDate.value == null;

  void onEndHabitOn(bool value) {
    isEndHabitOn.value = value;
  }

  void onEndHabitOnFilterTabTap(int index) {
    selectedEndHabitIndex.value = index;

    if (endHabitSelectedDate.value == null) {
      endHabitDatePickerController.text = getEndHabitPlaceholder;
    } else {
      handleEndHabitSelectedDate();
    }
  }

  bool onSelectedDayPredicate(DateTime day) {
    final normalizeValue = normalizeDate(day);
    return endHabitSelectedDate.value == normalizeValue;
  }

  void onSingleDaySelected(DateTime selected, DateTime focusedDate) {
    endHabitSelectedDate.value = normalizeDate(selected);
    endHabitFocusedDay.value = focusedDate;

    // Update text immediately
    //onEndHabitDateDays(selectedEndHabitIndex.value);
  }

  String get getEndHabitPlaceholder {
    return selectedEndHabitIndex.value == 0
        ? strSelectAnEndDate
        : strSelectDurationInDays;
  }

  void handleEndHabitOnOkClick(BuildContext context) {
    if (endHabitSelectedDate.value == null) {
      AppToast.warning(context, strPleaseSelectADate);
      return;
    }

    handleEndHabitSelectedDate();

    Get.back();
  }

  void handleEndHabitSelectedDate() {
    final selected = normalizeDate(endHabitSelectedDate.value!);
    if (selectedEndHabitIndex.value == 0) {
      // Date mode
      endHabitDatePickerController.text = DateClass.formatMonthDayYear(
        selected,
      );
    } else {
      // Days mode
      final today = normalizeDate(DateTime.now());
      final days = selected.difference(today).inDays;

      endHabitDatePickerController.text = days == 0
          ? strThisHabitEndsToday
          : endHabitDatePickerController.text = strEndsIn + ' $days ' + strDays;
    }
  }
}
