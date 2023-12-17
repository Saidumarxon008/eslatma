// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EndAdapter extends TypeAdapter<Endi> {
  @override
  final int typeId = 0;

  @override
  Endi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Endi(
      end: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Endi obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EndAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}