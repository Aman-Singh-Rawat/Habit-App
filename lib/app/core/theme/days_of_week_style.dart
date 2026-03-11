import 'package:flutter/cupertino.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

DaysOfWeekStyle daysOfWeekStyle(BuildContext context) {
  final style = TextStyle(
    color: context.textFieldTextColor,
    fontWeight: FontWeight.bold,
  );

  return DaysOfWeekStyle(
    dowTextFormatter: (date, locale) =>
        DateFormat.E(locale).format(date).substring(0, 2),
    weekdayStyle: style,
    weekendStyle: style,
  );
}
