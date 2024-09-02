import 'package:equatable/equatable.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

class SocialMedia extends Equatable {
  const SocialMedia({
    required this.platform,
    required this.url,
  });

  final SocialPlatform platform;
  final String url;

  SocialMedia copyWith({
    SocialPlatform? platform,
    String? url,
  }) {
    return SocialMedia(
      platform: platform ?? this.platform,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [platform, url];
}
