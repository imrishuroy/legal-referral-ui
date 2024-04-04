import 'package:freezed_annotation/freezed_annotation.dart';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
class License with _$License {
  const factory License({
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    @JsonKey(name: 'license_number') required String licenseNumber,
    @JsonKey(name: 'issue_date') required String issueDate,
    @JsonKey(name: 'issue_state') required String issueState,
    @JsonKey(name: 'license_id') int? id,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}
