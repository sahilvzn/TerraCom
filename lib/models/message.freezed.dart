// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get senderId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get receiverId => throw _privateConstructorUsedError; // Or 'broadcast'
  @HiveField(3)
  String get content => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(5)
  MessageStatus get status =>
      throw _privateConstructorUsedError; // Enum: sending, sent, delivered, read
  @HiveField(6)
  bool get isEncrypted => throw _privateConstructorUsedError;
  @HiveField(7)
  int get hopCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String senderId,
      @HiveField(2) String receiverId,
      @HiveField(3) String content,
      @HiveField(4) DateTime timestamp,
      @HiveField(5) MessageStatus status,
      @HiveField(6) bool isEncrypted,
      @HiveField(7) int hopCount});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? timestamp = null,
    Object? status = null,
    Object? isEncrypted = null,
    Object? hopCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
      isEncrypted: null == isEncrypted
          ? _value.isEncrypted
          : isEncrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      hopCount: null == hopCount
          ? _value.hopCount
          : hopCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String senderId,
      @HiveField(2) String receiverId,
      @HiveField(3) String content,
      @HiveField(4) DateTime timestamp,
      @HiveField(5) MessageStatus status,
      @HiveField(6) bool isEncrypted,
      @HiveField(7) int hopCount});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? timestamp = null,
    Object? status = null,
    Object? isEncrypted = null,
    Object? hopCount = null,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
      isEncrypted: null == isEncrypted
          ? _value.isEncrypted
          : isEncrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      hopCount: null == hopCount
          ? _value.hopCount
          : hopCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'MessageAdapter')
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.senderId,
      @HiveField(2) required this.receiverId,
      @HiveField(3) required this.content,
      @HiveField(4) required this.timestamp,
      @HiveField(5) required this.status,
      @HiveField(6) required this.isEncrypted,
      @HiveField(7) required this.hopCount});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String senderId;
  @override
  @HiveField(2)
  final String receiverId;
// Or 'broadcast'
  @override
  @HiveField(3)
  final String content;
  @override
  @HiveField(4)
  final DateTime timestamp;
  @override
  @HiveField(5)
  final MessageStatus status;
// Enum: sending, sent, delivered, read
  @override
  @HiveField(6)
  final bool isEncrypted;
  @override
  @HiveField(7)
  final int hopCount;

  @override
  String toString() {
    return 'Message(id: $id, senderId: $senderId, receiverId: $receiverId, content: $content, timestamp: $timestamp, status: $status, isEncrypted: $isEncrypted, hopCount: $hopCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isEncrypted, isEncrypted) ||
                other.isEncrypted == isEncrypted) &&
            (identical(other.hopCount, hopCount) ||
                other.hopCount == hopCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, receiverId,
      content, timestamp, status, isEncrypted, hopCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String senderId,
      @HiveField(2) required final String receiverId,
      @HiveField(3) required final String content,
      @HiveField(4) required final DateTime timestamp,
      @HiveField(5) required final MessageStatus status,
      @HiveField(6) required final bool isEncrypted,
      @HiveField(7) required final int hopCount}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get senderId;
  @override
  @HiveField(2)
  String get receiverId;
  @override // Or 'broadcast'
  @HiveField(3)
  String get content;
  @override
  @HiveField(4)
  DateTime get timestamp;
  @override
  @HiveField(5)
  MessageStatus get status;
  @override // Enum: sending, sent, delivered, read
  @HiveField(6)
  bool get isEncrypted;
  @override
  @HiveField(7)
  int get hopCount;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
