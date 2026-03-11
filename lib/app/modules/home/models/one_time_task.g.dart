// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_time_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneTimeTaskAdapter extends TypeAdapter<OneTimeTask> {
  @override
  final int typeId = 1;

  @override
  OneTimeTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneTimeTask(
      id: fields[0] as String,
      name: fields[1] as String,
      icon: fields[2] as String,
      color: fields[3] as String,
      scheduledDate: fields[4] as DateTime,
      reminderHour: fields[5] as int,
      reminderMinute: fields[6] as int,
      completedDates: (fields[7] as List?)?.cast<DateTime>(),
      createdAt: fields[8] as DateTime?,
      updatedAt: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, OneTimeTask obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.scheduledDate)
      ..writeByte(5)
      ..write(obj.reminderHour)
      ..writeByte(6)
      ..write(obj.reminderMinute)
      ..writeByte(7)
      ..write(obj.completedDates)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneTimeTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
