import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:habitly/app/modules/widgets/buttons/action_button_row.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../modules/widgets/bottom_seets/show_calendar_bottom_sheet.dart';
import '../../modules/widgets/buttons/custom_elevated_button.dart';
import '../../modules/widgets/others/build_calendar.dart';
import '../constants/app_constants.dart';
import '../constants/app_strings.dart';
import '../extensions/secondary_button_text.dart';
import '../utils/helpers/DateClass.dart';

mixin WhenOneTimeTaskMixin {
  final whenController = TextEditingController(text: strPleaseSelectADate);

  final Rx<DateTime> whenFocusedDay = DateTime.now().obs;

  Rx<DateTime?> whenSelectedDate = Rx<DateTime?>(null);

  void handleWhenOnCancelClick() {
    //selectedDate.value = null;

    whenSelectedDate.value = null;
    whenController.text = strPleaseSelectADate;
    Get.back();
  }

  void handleWhenWidgetDateOnOkClick(BuildContext context) {
    if (whenSelectedDate.value == null) {
      AppToast.warning(context, strPleaseSelectADate);
      return;
    }

    final selected = normalizeDate(whenSelectedDate.value!);

    whenController.text = DateClass.formatMonthDayYear(selected);

    Get.back();
  }

  bool onWhenSelectedDayPredicate(DateTime day) {
    final normalizeValue = normalizeDate(day);
    return whenSelectedDate.value == normalizeValue;
  }

  void onWhenSingleDaySelected(DateTime selected, DateTime focused) {
    whenSelectedDate.value = normalizeDate(selected);
    whenFocusedDay.value = focused;

    if (whenSelectedDate.value == null) {
      whenController.text = strPleaseSelectADate;
      return;
    }

    whenController.text = DateClass.formatMonthDayYear(whenSelectedDate.value!);
  }

  /// bottom sheet for when widget
  void onWhenCalendarTFClick(BuildContext context) {
    showCalendarBottomSheet(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Obx(
              () => buildCalendar(
                context: context,
                showHeader: true,
                firstDay: DateTime.now(),
                focusedDay: whenFocusedDay.value,
                selectedDayPredicate: onWhenSelectedDayPredicate,
                onDaySelected: onWhenSingleDaySelected,
              ),
            ),
          ),

          const SizedBox(height: 12),

          ActionButtonsRow(
            primaryText: strOk,
            primaryOnTap: () => handleWhenWidgetDateOnOkClick(context),
            secondaryText: strCancel,
            secondaryOnTap: handleWhenOnCancelClick,
          ),
        ],
      ),
    );
  }
}
