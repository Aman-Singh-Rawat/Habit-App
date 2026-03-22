import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/modules/home/widgets/home/weekly_overall_header_widget.dart';
import 'package:habitly/app/modules/home/widgets/home/weekly_weekdays_widget.dart';
import 'package:habitly/app/modules/widgets/container/custom_card.dart';

import '../../../../core/constants/app_lists.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../controllers/home_controller.dart';
import '../../models/regular_habit.dart';

class WeeklyTabWidget extends StatelessWidget {
  final RegularHabit habit;
  final int index;

  const WeeklyTabWidget({super.key, required this.habit, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.printInfo(info: "Weekly Tab Widget habit:: ${habit.toString()}");
    return mainWeeklyTabWidget();
  }

  Widget mainWeeklyTabWidget() {
    return CustomCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// above header contains [ICON, TITLE, AND DURATION OF HABIT]
          WeeklyOverallHeaderWidget(habit: habit),

          /// Week Selection
          weekSelection(),
        ],
      ),
      padding: EdgeInsets.all(AppSpacing.md.r),
    );
  }

  Row weekSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: AppLists.weeklyDay3Char
          .asMap()
          .entries
          .map(
            (e) => WeeklyWeekdaysWidget(
              text: e.value,
              isSelected: habit.weeklyDays?.contains(e.key + 1) ?? false,
              onClick: () => HomeController.instance.updateWeeklyHabitDays(
                index,
                e.key + 1,
              ),
            ),
          )
          .toList(),
    );
  }
}

/// 🔵 TOP GRADIENT STRIP
/*ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.md.r),
            ),
            child: Container(
              height: 4.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF00C6FF)],
                ),
              ),
            ),
          ),*/
