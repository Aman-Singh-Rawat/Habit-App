import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';

class PerWeakwidget extends StatelessWidget {
  const PerWeakwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            controller.selectedPerWeak.value == -1
                ? 'How Many Days a Weak'
                : '${controller.selectedPerWeak.value} ${AppStrings.daysPerWeek}',
            style: TextStyle(fontWeight: FontWeight.w500),
          ).paddingSymmetric(horizontal: AppSpacing.bf),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [1, 2, 3, 4, 5, 6, 7].map((item) {
              return GestureDetector(
                onTap: () => controller.onPerWeakClick(item),
                child: Obx(
                  () => Container(
                    margin: EdgeInsets.only(right: item == 7 ? 0 : 8.w),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: controller.selectedPerWeak.value == item
                          ? AppColors.primary
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.aboutUserDarkBorder),
                    ),
                    child: Center(child: Text(item.toString())),
                  ),
                ),
              );
            }).toList(),
          ),
        ).paddingOnly(left: 18.w, top: AppSpacing.sm),
      ],
    );
  }
}
