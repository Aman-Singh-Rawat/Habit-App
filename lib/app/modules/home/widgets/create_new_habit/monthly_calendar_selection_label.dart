import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../main.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../../controllers/regular_habit_controller.dart';

Widget monthlyCalendarSelectionLabel() {
  final controller = RegularHabitController.instance;
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: width_16),
    child: Obx(() {
      final days = controller.selectedMonthlyDays.toList()..sort();
      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: font_12,
            fontFamily: appFontFamily,
            color: AppColors.textFieldHintColor,
          ),
          children: days.isEmpty
              ? [const TextSpan(text: strNoDaysSelected)]
              : [
            TextSpan(text: '$strEveryMonthOn: '),
            TextSpan(
              text: days.map((d) => d + 1).join(', '),
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }),
  );
}