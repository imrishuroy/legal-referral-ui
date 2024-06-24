import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

part 'user_connection_status.freezed.dart';
part 'user_connection_status.g.dart';

@freezed
class UserConnectionStatus with _$UserConnectionStatus {
  const factory UserConnectionStatus({
    required ConnectionInvitationStatus status,
  }) = _UserConnectionStatus;

  factory UserConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionStatusFromJson(json);
}
