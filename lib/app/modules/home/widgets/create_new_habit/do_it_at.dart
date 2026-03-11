import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/utils/app_enums.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/segmented_option_selector.dart';
import 'package:habitly/app/modules/widgets/others/filter_widget.dart';

class DoItAtWidget extends StatelessWidget {
  const DoItAtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return SegmentedOptionSelector(
      text: AppStrings.doItAt,
      widget: Obx(
        () => Row(
          children: DoItAtEnum.values.asMap().entries.map((item) {
            final isSelected = controller.selectedDoItAtIndex.value == item.key;
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectedDoItAtIndex.value = item.key,
                child: FilterWidget(
                  itemName: item.value.name,
                  isSelected: isSelected,
                ).marginOnly(right: AppSpacing.md.w),
              ),
            );
          }).toList(),
        ).paddingOnly(left: 17.w),
      ),
    );
  }
}
