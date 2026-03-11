import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/theme/calendar_table_style.dart';
import 'package:habitly/app/core/theme/days_of_week_style.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.bf),
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.aboutUserDarkBorder),
        borderRadius: BorderRadius.circular(AppSpacing.md.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              '${AppStrings.everyMonthOn} ${controller.multiSelectedDays.map((e) => e.day).join(', ')}',
            ),
          ),

          Divider().paddingSymmetric(vertical: AppSpacing.sm.h),

          Obx(
                () => buildCalendar(
              key: ValueKey(controller.multiSelectedDays.length),
              context: context,
              firstDay: DateTime.utc(2010, 12, 31),
              focusedDay: controller.focusedDay.value,
              selectedDayPredicate: (day) {
                return controller.multiSelectedDays.any(
                      (d) => isSameDay(d, day),
                );
              },
              onDaySelected: controller.onDaySelected,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCalendar({
  Key? key,
  required BuildContext context,
  bool showHeader = false,
  required DateTime focusedDay,
  required DateTime firstDay,
  bool Function(DateTime)? selectedDayPredicate,
  required Function(DateTime, DateTime)? onDaySelected,
}) {
  return TableCalendar(
    key: key,
    calendarBuilders: CalendarBuilders(),
    headerVisible: showHeader,
    headerStyle: showHeader
        ? HeaderStyle(formatButtonVisible: false, titleCentered: true)
        : HeaderStyle(),
    availableGestures: AvailableGestures.none,

    firstDay: firstDay,
    lastDay: DateTime.utc(2030, 01, 01),
    focusedDay: focusedDay,

    selectedDayPredicate: selectedDayPredicate,

    onDaySelected: onDaySelected,

    daysOfWeekStyle: daysOfWeekStyle(context),
    calendarStyle: calendarStyle(context),
  );
}
