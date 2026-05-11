import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

import '../../../../core/constants/app_constants.dart';
import 'number_of_days_selection_item.dart';

class PerWeakWidget extends StatelessWidget {
  const PerWeakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// title
        _weeklyTitle(context),

        /// contains circular [counts] 1, 2, 3, 4, 5, 6, 7]
        _weeklyChildWidget(),
      ],
    ).paddingOnly(top: height_24);
  }

  Widget _weeklyTitle(BuildContext context) {
    final controller = RegularHabitController.instance;
    return Obx(
      () => Text(
        controller.repeatSelectedPerWeekValue.value == -1
            ? strHowManyDaysAWeak
            : '${controller.repeatSelectedPerWeekValue.value} $daysPerWeek',
        style: Theme.of(context).textTheme.labelLarge,
      ).paddingSymmetric(horizontal: width_20),
    );
  }
}

Widget _weeklyChildWidget() {
  final controller = RegularHabitController.instance;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Obx(
      () => Row(
        children: List.generate(7, (index) {
          final item = index + 1;

          final isSelected =
              controller.repeatSelectedPerWeekValue.value == item;

          return Padding(
            padding: EdgeInsets.only(
              right: width_8,
              left: index == 0 ? width_20 : 0,
            ),
            child: NumberOfDaysSelectionItem(
              item: item,
              isSelected: isSelected,
            ),
          );
        }),
      ),
    ),
  );
}
