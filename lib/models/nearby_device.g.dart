// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyDeviceImpl _$$NearbyDeviceImplFromJson(Map<String, dynamic> json) =>
    _$NearbyDeviceImpl(
      endpointId: json['endpointId'] as String,
      deviceName: json['deviceName'] as String,
      alias: json['alias'] as String,
      signalStrength: (json['signalStrength'] as num?)?.toInt() ?? 0,
      hopsAway: (json['hopsAway'] as num?)?.toInt() ?? 1,
      status: $enumDecode(_$DeviceStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$NearbyDeviceImplToJson(_$NearbyDeviceImpl instance) =>
    <String, dynamic>{
      'endpointId': instance.endpointId,
      'deviceName': instance.deviceName,
      'alias': instance.alias,
      'signalStrength': instance.signalStrength,
      'hopsAway': instance.hopsAway,
      'status': _$DeviceStatusEnumMap[instance.status]!,
    };

const _$DeviceStatusEnumMap = {
  DeviceStatus.discovered: 'discovered',
  DeviceStatus.connecting: 'connecting',
  DeviceStatus.connected: 'connected',
  DeviceStatus.disconnected: 'disconnected',
};
