// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regular_habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegularHabitAdapter extends TypeAdapter<RegularHabit> {
  @override
  final int typeId = 0;

  @override
  RegularHabit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegularHabit(
      id: fields[0] as String,
      name: fields[1] as String,
      icon: fields[2] as String,
      color: fields[3] as String,
      repeatType: fields[4] as String,
      repeatDays: fields[5] as dynamic,
      doItAt: fields[6] as String,
      endDate: fields[7] as DateTime?,
      reminderHour: fields[8] as int?,
      reminderMinute: fields[9] as int?,
      weeklyDays: (fields[10] as List?)?.cast<int>(),
      completedDates: (fields[11] as List?)?.cast<DateTime>(),
      createdAt: fields[12] as DateTime?,
      updatedAt: fields[13] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, RegularHabit obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.repeatType)
      ..writeByte(5)
      ..write(obj.repeatDays)
      ..writeByte(6)
      ..write(obj.doItAt)
      ..writeByte(7)
      ..write(obj.endDate)
      ..writeByte(8)
      ..write(obj.reminderHour)
      ..writeByte(9)
      ..write(obj.reminderMinute)
      ..writeByte(10)
      ..write(obj.weeklyDays)
      ..writeByte(11)
      ..write(obj.completedDates)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegularHabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
