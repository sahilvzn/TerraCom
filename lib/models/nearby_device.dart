import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_device.freezed.dart';
part 'nearby_device.g.dart';

@freezed
class NearbyDevice with _$NearbyDevice {
  const factory NearbyDevice({
    required String endpointId,
    required String deviceName,
    required String alias,
    @Default(0) int signalStrength,
    @Default(1) int hopsAway, 
    required DeviceStatus status,
  }) = _NearbyDevice;

  factory NearbyDevice.fromJson(Map<String, dynamic> json) => _$NearbyDeviceFromJson(json);
}

enum DeviceStatus {
  discovered,
  connecting,
  connected,
  disconnected,
}
