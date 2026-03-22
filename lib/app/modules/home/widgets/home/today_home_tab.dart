import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/home/widgets/home/skip_habit_content_widget.dart';

import '../../../../core/constants/app_constants.dart';
import 'habit_list.dart';

class TodayHomeTab extends StatelessWidget {
  const TodayHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return todayHomeMainWidget();
  }

  Widget todayHomeMainWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// incomplete habits
          incompleteHabits(),

          /// complete habits
          completedHabit(),
        ],
      ).paddingOnly(top: 15.h, left: AppSpacing.bf, right: AppSpacing.bf),
    );
  }

  Widget completedHabit() {
    final controller = HomeController.instance;
    return Obx(() {
      final todayHabitLists = controller.todayCompletedHabits;
      if (todayHabitLists.isEmpty) return SizedBox.shrink();
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  strCompleted,
                  style: TextStyle(color: AppColors.darkText),
                ),

                Expanded(child: Divider(indent: 5, endIndent: 0,)),
              ],
            ).paddingOnly(bottom: AppSpacing.xl),

            HabitList(
              habits: todayHabitLists,
              confirmDismiss: (direction, habit) =>
                  controller.confirmDismiss(direction, habit),
              direction: DismissDirection.startToEnd,
              background: _buildBackground(
                color: Colors.red.shade300,
                alignment: Alignment.centerLeft,
                childWidget: Icon(Icons.close, color: Colors.white, size: 30.w),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget incompleteHabits() {
    final controller = HomeController.instance;

    return Obx(() {
      final todayHabitLists = controller.todayHabits;
      if (todayHabitLists.isEmpty) return SizedBox.shrink();
      return HabitList(
        habits: todayHabitLists,
        confirmDismiss: (direction, habit) =>
            controller.confirmDismiss(direction, habit),
        background: _buildBackground(
          color: AppColors.success.s300,
          alignment: Alignment.centerLeft,
          childWidget: Icon(Icons.check, color: Colors.white, size: 30.w),
        ),

        secondaryBackground: _buildBackground(
          color: Colors.red.shade300,
          alignment: Alignment.centerRight,
          childWidget: SkipHabitContentWidget(),
        ),
        direction: DismissDirection.horizontal,
      ).paddingOnly(bottom: AppSpacing.xl);
    });
  }

  Widget _buildBackground({
    required Color color,
    required Alignment alignment,
    required Widget childWidget,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: childWidget,
    );
  }
}
