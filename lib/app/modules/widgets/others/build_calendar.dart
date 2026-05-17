import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/theme/calendar_table_style.dart';
import '../../../core/theme/days_of_week_style.dart';

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