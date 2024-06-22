// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionInvitationImpl _$$ConnectionInvitationImplFromJson(
        Map<String, dynamic> json) =>
    _$ConnectionInvitationImpl(
      id: (json['id'] as num?)?.toInt(),
      senderId: json['sender_id'] as String?,
      recipientId: json['recipient_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      about: json['about'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      status: $enumDecodeNullable(
          _$ConnectionInvitationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$ConnectionInvitationImplToJson(
        _$ConnectionInvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.senderId,
      'recipient_id': instance.recipientId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'about': instance.about,
      'avatar_url': instance.avatarUrl,
      'status': _$ConnectionInvitationStatusEnumMap[instance.status],
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ConnectionInvitationStatusEnumMap = {
  ConnectionInvitationStatus.pending: 'pending',
  ConnectionInvitationStatus.accepted: 'accepted',
  ConnectionInvitationStatus.rejected: 'rejected',
  ConnectionInvitationStatus.cancelled: 'cancelled',
  ConnectionInvitationStatus.none: 'none',
};
