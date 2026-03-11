import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/utils/app_enums.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/custom_calendar_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/on_these_day_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/per_weak_widget.dart';

class RepeatContentSection extends StatelessWidget {
  const RepeatContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return Obx(() {
      switch (RepeatEnum.values[controller.selectedRepeatIndex.value]) {
        case RepeatEnum.Daily:
          return const OnTheseDayWidget();

        case RepeatEnum.Weekly:
          return PerWeakwidget().paddingOnly(top: AppSpacing.xl);

        case RepeatEnum.Monthly:
          return CustomCalendarWidget().paddingOnly(top: AppSpacing.xl);
      }
    });
  }
}
