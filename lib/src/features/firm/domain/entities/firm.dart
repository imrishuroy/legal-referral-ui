import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'firm.freezed.dart';
part 'firm.g.dart';

@freezed
sealed class Firm with _$Firm {
  const factory Firm({
    required String name,
    @JsonKey(name: 'org_type') required String orgType,
    @JsonKey(name: 'logo_url') required String logoUrl,
    required String website,
    required String location,
    required String about,
    @JsonKey(name: 'owner_user_id') required String ownerUserId,
    @JsonKey(name: 'created_at')
    @DateTimeJsonConverter()
    required DateTime createdAt,
    @JsonKey(name: 'firm_id', includeToJson: false) int? firmId,
  }) = _Firm;

  factory Firm.fromJson(Map<String, dynamic> json) => _$FirmFromJson(json);
}
