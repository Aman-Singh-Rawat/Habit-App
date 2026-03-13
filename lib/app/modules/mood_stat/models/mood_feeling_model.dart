import 'package:habitly/app/modules/mood_stat/models/mood.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

part 'mood_feeling_model.g.dart';

@HiveType(typeId: 2)
class MoodFeelingModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String emoji;

  @HiveField(2)
  String title;

  @HiveField(3)
  String? feeling;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  DateTime? updatedAt;

  MoodFeelingModel({
    required this.id,
    this.feeling,
    required this.date,
    DateTime? createdAt,
    this.updatedAt, required this.emoji, required this.title,
  }) : createdAt = createdAt ?? DateTime.now();

  @override
  String toString() {
    return 'MoodFeelingModel(id: $id, emoji: $emoji, title: $title, feeling: $feeling, date: $date)';
  }
}
