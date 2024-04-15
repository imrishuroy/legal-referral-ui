part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, loaded, failure }

enum ExperienceStatus { initial, loading, success, failure }

enum CompanyStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  const ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.experienceStatus = ExperienceStatus.initial,
    this.experiences = const <Experience>[],
    this.companyStatus = CompanyStatus.initial,
    this.firms = const <Firm>[],
    this.failure,
  });

  factory ProfileState.initial() {
    return const ProfileState();
  }

  final ProfileStatus profileStatus;
  final ExperienceStatus experienceStatus;
  final List<Experience> experiences;
  final CompanyStatus companyStatus;
  final List<Firm?> firms;
  final Failure? failure;

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    ExperienceStatus? experienceStatus,
    List<Experience>? experiences,
    CompanyStatus? companyStatus,
    List<Firm?>? firms,
    Failure? failure,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      experienceStatus: experienceStatus ?? this.experienceStatus,
      experiences: experiences ?? this.experiences,
      companyStatus: companyStatus ?? this.companyStatus,
      firms: firms ?? this.firms,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        profileStatus,
        experienceStatus,
        experiences,
        companyStatus,
        firms,
        failure,
      ];
}
