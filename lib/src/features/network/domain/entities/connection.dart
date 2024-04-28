import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'connection.freezed.dart';
part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  const factory Connection({
    required int? id,
    @JsonKey(name: 'sender_id') required String? senderId,
    @JsonKey(name: 'recipient_id') required String? recipientId,
    @JsonKey(name: 'first_name') required String? firstName,
    @JsonKey(name: 'last_name') required String? lastName,
    @JsonKey(name: 'about') required String? about,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at')
    required DateTime? createdAt,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}
