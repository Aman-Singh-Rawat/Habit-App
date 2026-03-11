import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';
import 'package:habitly/app/modules/home/widgets/goal_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_lists.dart';

class HabitList extends StatelessWidget {
  final List<RegularHabit> habits;
  final DismissDirection direction;
  final Future<bool> Function(DismissDirection direction, RegularHabit habit)
  confirmDismiss;
  final Widget? background;
  final Widget? secondaryBackground;

  const HabitList({
    super.key,
    required this.habits,
    required this.confirmDismiss,
    this.background,
    this.secondaryBackground,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = habits[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: Dismissible(
            key: ValueKey(habit.id),
            direction: direction,
            background: background,
            secondaryBackground: secondaryBackground,
            confirmDismiss: (direction) => confirmDismiss(direction, habit),
            child: GoalWidget(
              habit: habit,
              isCompleted: habit.completedDates.contains(
                normalizeDate(DateTime.now()),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 15.h),
      itemCount: habits.length,
    );
  }
}
