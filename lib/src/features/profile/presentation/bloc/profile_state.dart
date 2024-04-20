part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

enum PricingStatus { initial, loading, success, failure }

enum ExperienceStatus { initial, loading, success, failure }

enum EducationStatus { initial, loading, success, failure }

enum CompanyStatus { initial, loading, success, failure }

enum SocialEnity { linkedin, twitter, facebook, instagram }

class ProfileState extends Equatable {
  const ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.pricingStatus = PricingStatus.initial,
    this.experienceStatus = ExperienceStatus.initial,
    this.educationStatus = EducationStatus.initial,
    this.experiences = const <Experience>[],
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
  final PricingStatus pricingStatus;
  final ExperienceStatus experienceStatus;
  final EducationStatus educationStatus;
  final List<Experience> experiences;
  final CompanyStatus companyStatus;
  final PriceServiceType selectedPriceServiceType;

  final UserProfile? userProfile;
  final List<Firm?> firms;
  final List<Social?> socials;
  final Failure? failure;

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    PricingStatus? pricingStatus,
    ExperienceStatus? experienceStatus,
    EducationStatus? educationStatus,
    List<Experience>? experiences,
    CompanyStatus? companyStatus,
    PriceServiceType? selectedPriceServiceType,
    UserProfile? userProfile,
    List<Firm?>? firms,
    List<Social?>? socials,
    Failure? failure,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      pricingStatus: pricingStatus ?? this.pricingStatus,
      experienceStatus: experienceStatus ?? this.experienceStatus,
      educationStatus: educationStatus ?? this.educationStatus,
      experiences: experiences ?? this.experiences,
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
        pricingStatus,
        experienceStatus,
        educationStatus,
        experiences,
        companyStatus,
        selectedPriceServiceType,
        userProfile,
        firms,
        socials,
        failure,
      ];
}
