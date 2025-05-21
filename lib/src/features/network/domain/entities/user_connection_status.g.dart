// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_connection_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserConnectionStatus _$UserConnectionStatusFromJson(
        Map<String, dynamic> json) =>
    _UserConnectionStatus(
      status: $enumDecode(_$ConnectionInvitationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$UserConnectionStatusToJson(
        _UserConnectionStatus instance) =>
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
