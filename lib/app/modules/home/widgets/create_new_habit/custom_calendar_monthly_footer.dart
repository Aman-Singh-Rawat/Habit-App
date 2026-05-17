import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../main.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../../controllers/regular_habit_controller.dart';

Padding customCalendarMonthlyFooter() {
  final controller = RegularHabitController.instance;
  return Padding(
    padding: EdgeInsets.fromLTRB(width_16, 0, width_16, width_12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          final n = controller.selectedMonthlyDays.length;
          return Text(
            '$n ${n == 1 ? strDay : strDays} $strSelected',
            style: TextStyle(
              fontSize: font_12,
              fontFamily: appFontFamily,
              color: AppColors.textFieldHintColor,
            ),
          );
        }),
        GestureDetector(
          onTap: () => controller.selectedMonthlyDays.clear(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width_10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.containerBackgroundColor,
              borderRadius: BorderRadius.circular(width_8),
            ),
            child: Text(
              strClearAll,
              style: TextStyle(
                fontSize: font_12,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w500,
                color: AppColors.textFieldHintColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}