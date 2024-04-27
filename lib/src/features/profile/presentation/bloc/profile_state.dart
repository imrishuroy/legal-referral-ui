part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, userInfoUpdated, failure }

enum UserInfoStatus { initial, loading, success, failure }

enum PricingStatus { initial, loading, success, failure }

enum SocialStatus { initial, loading, success, failure }

enum ExperienceStatus { initial, loading, success, failure }

enum EducationStatus { initial, loading, success, failure }

enum CompanyStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  const ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.userInfoStatus = UserInfoStatus.initial,
    this.pricingStatus = PricingStatus.initial,
    this.socialStatus = SocialStatus.initial,
    this.experienceStatus = ExperienceStatus.initial,
    this.educationStatus = EducationStatus.initial,
    this.experiences = const <UserExperience>[],
    this.educations = const <Education>[],
    this.companyStatus = CompanyStatus.initial,
    this.selectedPriceServiceType = PriceServiceType.perHour,
    this.userProfile,
    this.firms = const <Firm>[],
    this.socials = const <Social>[],
    this.failure,
  });

  factory ProfileState.initial() {
    return const ProfileState();
  }

  final ProfileStatus profileStatus;
  final UserInfoStatus userInfoStatus;
  final PricingStatus pricingStatus;
  final SocialStatus socialStatus;
  final ExperienceStatus experienceStatus;
  final EducationStatus educationStatus;
  final List<UserExperience?> experiences;
  final List<Education?> educations;
  final CompanyStatus companyStatus;
  final PriceServiceType selectedPriceServiceType;
  final UserProfile? userProfile;
  final List<Firm?> firms;
  final List<Social?> socials;
  final Failure? failure;

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    UserInfoStatus? userInfoStatus,
    PricingStatus? pricingStatus,
    SocialStatus? socialStatus,
    ExperienceStatus? experienceStatus,
    EducationStatus? educationStatus,
    List<UserExperience?>? experiences,
    List<Education?>? educations,
    CompanyStatus? companyStatus,
    PriceServiceType? selectedPriceServiceType,
    UserProfile? userProfile,
    List<Firm?>? firms,
    List<Social?>? socials,
    Failure? failure,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      userInfoStatus: userInfoStatus ?? this.userInfoStatus,
      pricingStatus: pricingStatus ?? this.pricingStatus,
      socialStatus: socialStatus ?? this.socialStatus,
      experienceStatus: experienceStatus ?? this.experienceStatus,
      educationStatus: educationStatus ?? this.educationStatus,
      experiences: experiences ?? this.experiences,
      educations: educations ?? this.educations,
      companyStatus: companyStatus ?? this.companyStatus,
      selectedPriceServiceType:
          selectedPriceServiceType ?? this.selectedPriceServiceType,
      userProfile: userProfile ?? this.userProfile,
      firms: firms ?? this.firms,
      socials: socials ?? this.socials,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        profileStatus,
        userInfoStatus,
        pricingStatus,
        socialStatus,
        experienceStatus,
        educationStatus,
        experiences,
        educations,
        companyStatus,
        selectedPriceServiceType,
        userProfile,
        firms,
        socials,
        failure,
      ];
}
