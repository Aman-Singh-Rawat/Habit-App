// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_feeling_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodFeelingModelAdapter extends TypeAdapter<MoodFeelingModel> {
  @override
  final int typeId = 2;

  @override
  MoodFeelingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodFeelingModel(
      id: fields[0] as String,
      feeling: fields[3] as String?,
      date: fields[4] as DateTime,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      emoji: fields[1] as String,
      title: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoodFeelingModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.emoji)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.feeling)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodFeelingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
