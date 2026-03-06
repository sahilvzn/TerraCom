// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<_$ProfileImpl> {
  @override
  final int typeId = 0;

  @override
  _$ProfileImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ProfileImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      photoColor: fields[2] as String?,
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$ProfileImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photoColor)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      photoColor: json['photoColor'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoColor': instance.photoColor,
      'createdAt': instance.createdAt.toIso8601String(),
    };
