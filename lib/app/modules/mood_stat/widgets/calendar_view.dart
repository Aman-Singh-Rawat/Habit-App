import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import 'mood_day_tile.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';

import 'mood_day_tile.dart';

class MoodCalendarView extends StatelessWidget {
  const MoodCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MoodStatController.instance;

    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 5,
          mainAxisExtent: 90,
        ),
        itemCount:
        controller.daysInMonth.value + controller.firstWeekday.value - 1,
        itemBuilder: (context, index) {
          int day = index - controller.firstWeekday.value + 2;

          final date = DateTime(
            controller.selectedMonth.value.year,
            controller.selectedMonth.value.month,
            day,
          );

          return MoodDayTile(date: date);
        },
      );
    });
  }
}
