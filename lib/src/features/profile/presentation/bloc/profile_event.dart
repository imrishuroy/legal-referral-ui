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

class AvatarUpdated extends ProfileEvent {
  const AvatarUpdated({
    required this.file,
  });

  final File file;

  @override
  List<Object> get props => [file];
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

class SocialUpdated extends ProfileEvent {
  const SocialUpdated({
    required this.socialId,
    required this.social,
  });

  final int socialId;
  final Social social;

  @override
  List<Object> get props => [socialId, social];
}

class SocialsFetched extends ProfileEvent {
  const SocialsFetched({
    required this.entityType,
    required this.entityId,
  });

  final EntityType entityType;
  final String entityId;

  @override
  List<Object> get props => [entityType, entityId];
}

class SocialDeleted extends ProfileEvent {
  const SocialDeleted({
    required this.socialId,
  });

  final int socialId;

  @override
  List<Object> get props => [socialId];
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

// profile/experiences

class ExperienceAdded extends ProfileEvent {
  const ExperienceAdded({
    required this.addExperienceReq,
  });

  final AddUpdateExperienceReq addExperienceReq;

  @override
  List<Object> get props => [addExperienceReq];
}

class ExperienceFetched extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ExperienceUpdated extends ProfileEvent {
  const ExperienceUpdated({
    required this.experienceId,
    required this.experienceReq,
  });

  final int experienceId;
  final AddUpdateExperienceReq experienceReq;

  @override
  List<Object> get props => [experienceId, experienceReq];
}

class ExperienceDeleted extends ProfileEvent {
  const ExperienceDeleted({
    required this.experienceId,
  });

  final int experienceId;

  @override
  List<Object> get props => [experienceId];
}

// profile/educations
class EducationAdded extends ProfileEvent {
  const EducationAdded({
    required this.education,
  });

  final Education education;

  @override
  List<Object> get props => [education];
}

class EducationFetched extends ProfileEvent {}

class EducationUpdated extends ProfileEvent {
  const EducationUpdated({
    required this.educationId,
    required this.education,
  });

  final int educationId;
  final Education education;

  @override
  List<Object> get props => [educationId, education];
}

class EducationDeleted extends ProfileEvent {
  const EducationDeleted({
    required this.educationId,
  });

  final int educationId;

  @override
  List<Object> get props => [educationId];
}

class FeaturePostUnsaved extends ProfileEvent {
  const FeaturePostUnsaved({
    required this.postId,
  });

  final int postId;

  @override
  List<Object> get props => [postId];
}

class FeaturePostsFetched extends ProfileEvent {
  const FeaturePostsFetched({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}
