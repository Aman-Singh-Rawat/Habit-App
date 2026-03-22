import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';

import 'mood_day_tile.dart';
import 'mood_summary_strip.dart';

class MoodCalendarView extends StatelessWidget {
  const MoodCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MoodStatController.instance;

    return Obx(() {
      final firstWeekday = controller.firstWeekday.value;
      final daysInMonth = controller.daysInMonth.value;
      final selectedMonth = controller.selectedMonth.value;

      // Previous month's trailing days to fill empty slots
      final prevMonthDate = DateTime(
        selectedMonth.year,
        selectedMonth.month,
        0,
      );
      final prevMonthDays = prevMonthDate.day;
      final emptySlots = firstWeekday - 1; // slots before day 1

      final totalCells = daysInMonth + emptySlots;

      // Mood tracked summary
      final filledCount = controller.moodMap.values
          .where(
            (m) =>
                m.date.month == selectedMonth.month &&
                m.date.year == selectedMonth.year,
          )
          .length;
      final totalPast = _countPastDaysInMonth(controller);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 5,
              mainAxisExtent: 90,
            ),
            itemCount: totalCells,
            itemBuilder: (context, index) {
              if (index < emptySlots) {
                // Previous month's dates
                final prevDay = prevMonthDays - emptySlots + index + 1;
                final prevDate = DateTime(
                  selectedMonth.year,
                  selectedMonth.month - 1,
                  prevDay,
                );
                return MoodDayTile(date: prevDate, isOverflow: true);
              }

              final day = index - emptySlots + 1;
              final date = DateTime(
                selectedMonth.year,
                selectedMonth.month,
                day,
              );

              return MoodDayTile(date: date);
            },
          ),

          SizedBox(height: 16.h),

          MoodSummaryStrip(filledCount: filledCount, totalDays: totalPast),
        ],
      );
    });
  }

  int _countPastDaysInMonth(MoodStatController controller) {
    final now = DateTime.now();
    final month = controller.selectedMonth.value;
    // returning previous days
    if (month.year == now.year && month.month == now.month) return now.day;

    // month is already completed so return total number of days in a month
    if (month.isBefore(DateTime(now.year, now.month))) {
      return controller.daysInMonth.value;
    }
    return 0;
  }
}


