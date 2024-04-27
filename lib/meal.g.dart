// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 1;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      name: fields[0] as String?,
      imgPath: fields[1] as String?,
    )..identifiant = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imgPath)
      ..writeByte(2)
      ..write(obj.identifiant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
