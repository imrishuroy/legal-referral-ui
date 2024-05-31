import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'proposal.freezed.dart';
part 'proposal.g.dart';

enum ProposalStatus {
  active,
  awarded,
  accepted,
  started,
  completed,
  rejected,
  cancelled
}

@freezed
class Proposal with _$Proposal {
  const factory Proposal({
    @JsonKey(name: 'project_id') required int? referralId,
    @JsonKey(name: 'user_id') required String? userId,
    required String? title,
    required String? proposal,
    @JsonKey(
      name: 'proposal_id',
      includeIfNull: false,
    )
    int? proposalId,
    @JsonKey(
      name: 'status',
      includeToJson: false,
    )
    @Default(ProposalStatus.active)
    ProposalStatus? status,
    @JsonKey(
      name: 'created_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? createdAt,
    @JsonKey(
      name: 'updated_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? updatedAt,
  }) = _Proposal;

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);
}
