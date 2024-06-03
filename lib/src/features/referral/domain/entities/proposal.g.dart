// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProposalImpl _$$ProposalImplFromJson(Map<String, dynamic> json) =>
    _$ProposalImpl(
      referralId: (json['project_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      title: json['title'] as String?,
      proposal: json['proposal'] as String?,
      proposalId: (json['proposal_id'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$ProposalStatusEnumMap, json['status']) ??
          ProposalStatus.active,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeJsonConverter().fromJson),
    );

Map<String, dynamic> _$$ProposalImplToJson(_$ProposalImpl instance) {
  final val = <String, dynamic>{
    'project_id': instance.referralId,
    'user_id': instance.userId,
    'title': instance.title,
    'proposal': instance.proposal,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('proposal_id', instance.proposalId);
  return val;
}

const _$ProposalStatusEnumMap = {
  ProposalStatus.active: 'active',
  ProposalStatus.awarded: 'awarded',
  ProposalStatus.accepted: 'accepted',
  ProposalStatus.started: 'started',
  ProposalStatus.completed: 'completed',
  ProposalStatus.rejected: 'rejected',
  ProposalStatus.cancelled: 'cancelled',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
