import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  @HiveType(typeId: 0, adapterName: 'ProfileAdapter')
  const factory Profile({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) String? photoColor,
    @HiveField(3) required DateTime createdAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
