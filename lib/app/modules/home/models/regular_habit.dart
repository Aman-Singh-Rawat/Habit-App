import 'package:flutter/material.dart';
import 'package:habitly/app/modules/home/models/base_habit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:table_calendar/table_calendar.dart';

part 'regular_habit.g.dart';

@HiveType(typeId: 0)
class RegularHabit extends HiveObject implements BaseHabit {
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
  final String repeatType;

  @HiveField(5)
  final dynamic repeatDays;

  @override
  @HiveField(6)
  final String doItAt;

  @HiveField(7)
  final DateTime? endDate;

  @override
  @HiveField(8)
  final int? reminderHour;

  @override
  @HiveField(9)
  final int? reminderMinute;

  @HiveField(10)
  List<int>? weeklyDays;

  @HiveField(11)
  final List<DateTime> completedDates;

  @HiveField(12)
  final DateTime createdAt;

  @HiveField(13)
  final DateTime? updatedAt;

  RegularHabit({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.repeatType,
    required this.repeatDays,
    required this.doItAt,
    this.endDate,
    required this.reminderHour,
    required this.reminderMinute,
    this.weeklyDays,
    List<DateTime>? completedDates,
    DateTime? createdAt,
    this.updatedAt,
  }) : completedDates = completedDates ?? [],
       createdAt = createdAt ?? normalizeDate(DateTime.now());

  TimeOfDay get reminderTime =>
      TimeOfDay(hour: reminderHour ?? 0, minute: reminderMinute ?? 0);

  @override
  String toString() {
    return 'RegularHabit('
        'id: $id, '
        'name: $name, '
        'color: $color, '
        'icon: $icon, '
        'doItAt: $doItAt, '
        'repeatType: $repeatType, '
        'repeatDays: $repeatDays, '
        'reminder: $reminderHour:$reminderMinute, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt '
        ')';
  }
}
