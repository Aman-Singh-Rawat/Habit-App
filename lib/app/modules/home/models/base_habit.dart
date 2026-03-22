abstract class BaseHabit {
  String get id;
  String get name;
  String get icon;
  String get color;
  String get doItAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get reminderHour;
  int? get reminderMinute;
}
