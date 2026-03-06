// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbyDevice _$NearbyDeviceFromJson(Map<String, dynamic> json) {
  return _NearbyDevice.fromJson(json);
}

/// @nodoc
mixin _$NearbyDevice {
  String get endpointId => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get alias => throw _privateConstructorUsedError;
  int get signalStrength => throw _privateConstructorUsedError;
  int get hopsAway => throw _privateConstructorUsedError;
  DeviceStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbyDeviceCopyWith<NearbyDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyDeviceCopyWith<$Res> {
  factory $NearbyDeviceCopyWith(
          NearbyDevice value, $Res Function(NearbyDevice) then) =
      _$NearbyDeviceCopyWithImpl<$Res, NearbyDevice>;
  @useResult
  $Res call(
      {String endpointId,
      String deviceName,
      String alias,
      int signalStrength,
      int hopsAway,
      DeviceStatus status});
}

/// @nodoc
class _$NearbyDeviceCopyWithImpl<$Res, $Val extends NearbyDevice>
    implements $NearbyDeviceCopyWith<$Res> {
  _$NearbyDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpointId = null,
    Object? deviceName = null,
    Object? alias = null,
    Object? signalStrength = null,
    Object? hopsAway = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      endpointId: null == endpointId
          ? _value.endpointId
          : endpointId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      signalStrength: null == signalStrength
          ? _value.signalStrength
          : signalStrength // ignore: cast_nullable_to_non_nullable
              as int,
      hopsAway: null == hopsAway
          ? _value.hopsAway
          : hopsAway // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyDeviceImplCopyWith<$Res>
    implements $NearbyDeviceCopyWith<$Res> {
  factory _$$NearbyDeviceImplCopyWith(
          _$NearbyDeviceImpl value, $Res Function(_$NearbyDeviceImpl) then) =
      __$$NearbyDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String endpointId,
      String deviceName,
      String alias,
      int signalStrength,
      int hopsAway,
      DeviceStatus status});
}

/// @nodoc
class __$$NearbyDeviceImplCopyWithImpl<$Res>
    extends _$NearbyDeviceCopyWithImpl<$Res, _$NearbyDeviceImpl>
    implements _$$NearbyDeviceImplCopyWith<$Res> {
  __$$NearbyDeviceImplCopyWithImpl(
      _$NearbyDeviceImpl _value, $Res Function(_$NearbyDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpointId = null,
    Object? deviceName = null,
    Object? alias = null,
    Object? signalStrength = null,
    Object? hopsAway = null,
    Object? status = null,
  }) {
    return _then(_$NearbyDeviceImpl(
      endpointId: null == endpointId
          ? _value.endpointId
          : endpointId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      signalStrength: null == signalStrength
          ? _value.signalStrength
          : signalStrength // ignore: cast_nullable_to_non_nullable
              as int,
      hopsAway: null == hopsAway
          ? _value.hopsAway
          : hopsAway // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyDeviceImpl implements _NearbyDevice {
  const _$NearbyDeviceImpl(
      {required this.endpointId,
      required this.deviceName,
      required this.alias,
      this.signalStrength = 0,
      this.hopsAway = 1,
      required this.status});

  factory _$NearbyDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyDeviceImplFromJson(json);

  @override
  final String endpointId;
  @override
  final String deviceName;
  @override
  final String alias;
  @override
  @JsonKey()
  final int signalStrength;
  @override
  @JsonKey()
  final int hopsAway;
  @override
  final DeviceStatus status;

  @override
  String toString() {
    return 'NearbyDevice(endpointId: $endpointId, deviceName: $deviceName, alias: $alias, signalStrength: $signalStrength, hopsAway: $hopsAway, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyDeviceImpl &&
            (identical(other.endpointId, endpointId) ||
                other.endpointId == endpointId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.signalStrength, signalStrength) ||
                other.signalStrength == signalStrength) &&
            (identical(other.hopsAway, hopsAway) ||
                other.hopsAway == hopsAway) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, endpointId, deviceName, alias,
      signalStrength, hopsAway, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyDeviceImplCopyWith<_$NearbyDeviceImpl> get copyWith =>
      __$$NearbyDeviceImplCopyWithImpl<_$NearbyDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyDeviceImplToJson(
      this,
    );
  }
}

abstract class _NearbyDevice implements NearbyDevice {
  const factory _NearbyDevice(
      {required final String endpointId,
      required final String deviceName,
      required final String alias,
      final int signalStrength,
      final int hopsAway,
      required final DeviceStatus status}) = _$NearbyDeviceImpl;

  factory _NearbyDevice.fromJson(Map<String, dynamic> json) =
      _$NearbyDeviceImpl.fromJson;

  @override
  String get endpointId;
  @override
  String get deviceName;
  @override
  String get alias;
  @override
  int get signalStrength;
  @override
  int get hopsAway;
  @override
  DeviceStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$NearbyDeviceImplCopyWith<_$NearbyDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
