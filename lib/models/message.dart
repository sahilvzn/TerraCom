import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  @HiveType(typeId: 1, adapterName: 'MessageAdapter')
  const factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required String senderId,
    @HiveField(2) required String receiverId, // Or 'broadcast'
    @HiveField(3) required String content,
    @HiveField(4) required DateTime timestamp,
    @HiveField(5) required MessageStatus status, // Enum: sending, sent, delivered, read
    @HiveField(6) required bool isEncrypted,
    @HiveField(7) required int hopCount,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

@HiveType(typeId: 2, adapterName: 'MessageStatusAdapter')
enum MessageStatus {
  @HiveField(0) sending,
  @HiveField(1) sent,
  @HiveField(2) delivered,
  @HiveField(3) read,
}
