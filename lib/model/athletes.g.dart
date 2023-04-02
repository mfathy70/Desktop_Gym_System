// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athletes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AthletesAdapter extends TypeAdapter<Athletes> {
  @override
  final int typeId = 0;

  @override
  Athletes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Athletes()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..phoneNumber = fields[2] as String
      ..paymentDate = fields[3] as DateTime
      ..paid = fields[4] as int
      ..withCoach = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, Athletes obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.paymentDate)
      ..writeByte(4)
      ..write(obj.paid)
      ..writeByte(5)
      ..write(obj.withCoach);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AthletesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
