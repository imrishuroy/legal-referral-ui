part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileFetched extends ProfileEvent {
  const ProfileFetched({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [
        userId,
      ];
}

class FirmSearched extends ProfileEvent {
  const FirmSearched({
    required this.query,
    required this.limit,
    required this.offset,
  });

  final String query;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [query, limit, offset];
}

class ExperienceAdded extends ProfileEvent {
  const ExperienceAdded({
    required this.addExperienceReq,
  });

  final AddExperienceReq addExperienceReq;

  @override
  List<Object> get props => [addExperienceReq];
}

class EducationAdded extends ProfileEvent {
  const EducationAdded({
    required this.education,
  });

  final Education education;

  @override
  List<Object> get props => [education];
}

class UserInfoUpdated extends ProfileEvent {
  const UserInfoUpdated({
    required this.uploadUserInfoReq,
  });

  final UploadUserInfoReq uploadUserInfoReq;

  @override
  List<Object> get props => [uploadUserInfoReq];
}

class PricingOptionSelected extends ProfileEvent {
  const PricingOptionSelected({
    required this.pricinServiceType,
  });

  final PriceServiceType pricinServiceType;

  @override
  List<Object> get props => [pricinServiceType];
}

class PriceAdded extends ProfileEvent {
  const PriceAdded({
    required this.price,
  });

  final Price price;

  @override
  List<Object> get props => [price];
}

class PriceUpdated extends ProfileEvent {
  const PriceUpdated({
    required this.priceId,
    required this.price,
  });

  final int priceId;
  final Price price;

  @override
  List<Object> get props => [priceId, price];
}

class SocialAdded extends ProfileEvent {
  const SocialAdded({
    required this.social,
  });

  final Social social;

  @override
  List<Object> get props => [social];
}

class ReferralToggled extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class BannerUpdated extends ProfileEvent {
  const BannerUpdated({
    required this.file,
  });

  final File file;

  @override
  List<Object> get props => [file];
}

class UserProfileUpdated extends ProfileEvent {
  const UserProfileUpdated({
    required this.userProfile,
  });

  final UserProfile userProfile;

  @override
  List<Object> get props => [userProfile];
}
