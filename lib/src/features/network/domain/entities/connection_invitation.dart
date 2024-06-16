import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'connection_invitation.freezed.dart';
part 'connection_invitation.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum ConnectionInvitationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('none')
  none,
}

@freezed
class ConnectionInvitation with _$ConnectionInvitation {
  const factory ConnectionInvitation({
    required int? id,
    @JsonKey(name: 'sender_id') required String? senderId,
    @JsonKey(name: 'recipient_id') required String? recipientId,
    @JsonKey(name: 'first_name') required String? firstName,
    @JsonKey(name: 'last_name') required String? lastName,
    @JsonKey(name: 'about') required String? about,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at', includeToJson: false)
    required DateTime? createdAt,
    @JsonKey(name: 'status') required ConnectionInvitationStatus? status,
  }) = _ConnectionInvitation;

  factory ConnectionInvitation.fromJson(Map<String, dynamic> json) =>
      _$ConnectionInvitationFromJson(json);
}
