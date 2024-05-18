import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'proposal_req.freezed.dart';
part 'proposal_req.g.dart';

@freezed
class ProposalReq with _$ProposalReq {
  const factory ProposalReq({
    @JsonKey(name: 'referral_id') required int? referralId,
    @JsonKey(name: 'user_id') required String? userId,
    required String? title,
    required String? proposal,
    @JsonKey(
      name: 'proposal_id',
      includeIfNull: false,
    )
    int? proposalId,
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
  }) = _ProposalReq;

  factory ProposalReq.fromJson(Map<String, dynamic> json) =>
      _$ProposalReqFromJson(json);
}
