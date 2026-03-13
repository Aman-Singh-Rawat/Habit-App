import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/modules/home/widgets/home/weekly_overall_header_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constants/app_lists.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../widgets/container/custom_card.dart';
import '../../controllers/home_controller.dart';

class OverallTab extends StatelessWidget {
  const OverallTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WeeklyOverallHeaderWidget(
            habit: HomeController.instance.regularHabits.first,
          ),
          SizedBox(
            height: 160.h,
            child: Builder(
              builder: (context) {
                final habit = HomeController.instance.regularHabits.first;

                final DateTime startDate = normalizeDate(habit.createdAt);
                final daysSinceStart =
                    DateTime.now().difference(startDate).inDays + 1;

                final totalDays = max(90, daysSinceStart);

                // Monday = 1, Sunday = 7
                final int startWeekday = startDate.weekday;

                // Empty cells before first real day
                final int emptySlots = startWeekday - 1;

                // Total grid items
                final int itemCount = emptySlots + totalDays;

                return GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    /// 1️⃣ Weekday headers
                    if (index < 7) {
                      return Center(
                        child: Text(AppLists.weekDayPrefixLetter[index]),
                      );
                    }

                    final int adjustedIndex = index - 7;
                    final bool isCompleted;

                    /// 2️⃣ Empty placeholders
                    if (adjustedIndex < emptySlots) {
                      isCompleted = false;
                    } else {
                      /// 3️⃣ Actual habit days
                      final int dayIndex = adjustedIndex - emptySlots;

                      final DateTime currentDate = startDate.add(
                        Duration(days: dayIndex),
                      );

                      isCompleted = habit.completedDates.contains(
                        normalizeDate(currentDate),
                      );
                    }

                    return Center(
                      child: SizedBox.square(
                        dimension: 12.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? AppColors.primary
                                : AppColors.primary.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSpacing.md.r),
    ).paddingSymmetric(horizontal: AppSpacing.bf, vertical: AppSpacing.bf);
  }
}
