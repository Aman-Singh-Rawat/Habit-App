import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../../../main.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../../controllers/regular_habit_controller.dart';

Widget customMonthlyDayGrid() {
  final controller = RegularHabitController.instance;
  return Padding(
    padding: EdgeInsets.fromLTRB(width_16, 0, width_16, width_12),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 31,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return Obx(() {
          final isSelected = controller.selectedMonthlyDays.contains(
            index,
          );

          return GestureDetector(
            onTap: () => controller.onRepeatDateSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: font_12,
                    fontFamily: isSelected
                        ? dmMonoFontFamily
                        : appFontFamily,
                    fontWeight: isSelected
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : AppColors.textFieldHintColor,
                  ),
                ),
              ),
            ),
          ).paddingAll(width_5);
        });
      },
    ),
  );
}