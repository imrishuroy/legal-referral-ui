import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_details.freezed.dart';
part 'device_details.g.dart';

@freezed
class DeviceDetails with _$DeviceDetails {
  const factory DeviceDetails({
    @JsonKey(name: 'device_id') required String? deviceId,
    @JsonKey(name: 'device_token') required String? deviceToken,
    @JsonKey(name: 'user_id') required String? userId,
  }) = _DeviceDetails;

  factory DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailsFromJson(json);
}
