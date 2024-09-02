part of 'firm_bloc.dart';

abstract class FirmEvent extends Equatable {
  const FirmEvent();

  @override
  List<Object> get props => [];
}

class FirmAdded extends FirmEvent {
  const FirmAdded({
    required this.firm,
  });
  final AddFirmReq firm;

  @override
  List<Object> get props => [firm];
}

class MyFirmsFetched extends FirmEvent {
  const MyFirmsFetched({
    required this.ownerId,
  });
  final String ownerId;

  @override
  List<Object> get props => [ownerId];
}

class SocialMediaFieldAdded extends FirmEvent {}

class SocialMediaEntered extends FirmEvent {
  const SocialMediaEntered({
    required this.socialMedia,
    required this.index,
  });
  final SocialMedia socialMedia;
  final int index;

  @override
  List<Object> get props => [socialMedia, index];
}

class SocialMediaPlatformSelected extends FirmEvent {
  const SocialMediaPlatformSelected({
    required this.platform,
    required this.index,
  });
  final SocialPlatform platform;
  final int index;

  @override
  List<Object> get props => [platform, index];
}

class SocialLinkChanged extends FirmEvent {
  const SocialLinkChanged({
    required this.url,
    required this.index,
  });
  final String url;
  final int index;

  @override
  List<Object> get props => [url, index];
}

class FirmLogoFileSelected extends FirmEvent {}

class FirmLogoFileDeleted extends FirmEvent {}

class FirmSocialMediaAdded extends FirmEvent {}

class FirmSocialsFetched extends FirmEvent {
  const FirmSocialsFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}
