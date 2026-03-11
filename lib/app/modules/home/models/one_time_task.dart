import 'package:flutter/material.dart';
import 'package:habitly/app/modules/home/models/base_habit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:table_calendar/table_calendar.dart';

part 'one_time_task.g.dart';

@HiveType(typeId: 1)
class OneTimeTask extends HiveObject implements BaseHabit {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String name;

  @override
  @HiveField(2)
  final String icon;

  @override
  @HiveField(3)
  final String color;

  @HiveField(4)
  final DateTime scheduledDate;

  @HiveField(5)
  final int reminderHour;

  @HiveField(6)
  final int reminderMinute;


  @HiveField(7)
  final List<DateTime> completedDates;

  @HiveField(8)
  final DateTime createdAt;

  @HiveField(9)
  final DateTime? updatedAt;

  OneTimeTask({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.scheduledDate,
    required this.reminderHour,
    required this.reminderMinute,
    List<DateTime>? completedDates,
    DateTime? createdAt,
    this.updatedAt,
  }) : completedDates = completedDates ?? [],
        createdAt = createdAt ?? normalizeDate(DateTime.now());

  TimeOfDay get reminderTime =>
      TimeOfDay(hour: reminderHour, minute: reminderMinute);
}
