// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_connection_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserConnectionStatusImpl _$$UserConnectionStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$UserConnectionStatusImpl(
      status: $enumDecode(_$ConnectionInvitationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UserConnectionStatusImplToJson(
        _$UserConnectionStatusImpl instance) =>
    <String, dynamic>{
      'status': _$ConnectionInvitationStatusEnumMap[instance.status]!,
    };

const _$ConnectionInvitationStatusEnumMap = {
  ConnectionInvitationStatus.pending: 'pending',
  ConnectionInvitationStatus.accepted: 'accepted',
  ConnectionInvitationStatus.rejected: 'rejected',
  ConnectionInvitationStatus.cancelled: 'cancelled',
  ConnectionInvitationStatus.none: 'none',
};
