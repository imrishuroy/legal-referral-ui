import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'profile_event.dart';
part 'profile_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required AuthBloc authBloc,
    required ProfileUseCase profileUseCase,
  })  : _profileUseCase = profileUseCase,
        _authBloc = authBloc,
        super(ProfileState.initial()) {
    on<ProfileFetched>(_onProfileFetched);
    on<AvatarUpdated>(_onAvatarUpdated);
    on<FirmSearched>(_onFirmSearched, transformer: debounce(_duration));
    on<UserInfoUpdated>(_onUserInfoUpdated);
    on<PricingOptionSelected>(_onPricingOptionSelected);
    on<PriceAdded>(_onPriceAdded);
    on<PriceUpdated>(_onPriceUpdated);
    on<SocialAdded>(_onSocialAdded);
    on<SocialUpdated>(_onSocialUpdated);
    on<SocialsFetched>(_onSocialsFetched);
    on<SocialDeleted>(_onSocialDeleted);
    on<ReferralToggled>(_onReferralToggled);
    on<BannerUpdated>(_onBannerUpdated);
    on<UserProfileUpdated>(_onUserProfileUpdated);
    on<ExperienceAdded>(_onExperienceAdded);
    on<ExperienceFetched>(_onExperienceFetched);
    on<ExperienceUpdated>(_onExperienceUpdated);
    on<ExperienceDeleted>(_onExperienceDeleted);
    on<EducationAdded>(_onEducationAdded);
    on<EducationFetched>(_onEducationFetched);
    on<EducationUpdated>(_onEducationUpdated);
    on<EducationDeleted>(_onEducationDeleted);
    on<FeaturePostsFetched>(_onFeaturePostsFetched);
    on<FeaturePostUnsaved>(_onFeaturePostUnsaved);
  }

  final AuthBloc _authBloc;
  final ProfileUseCase _profileUseCase;

  Future<void> _onProfileFetched(
    ProfileFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        profileStatus: ProfileStatus.loading,
      ),
    );
    final res = await _profileUseCase.fetchUserProfile(
      userId: event.userId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (user) {
        if (user != null) {
          emit(
            state.copyWith(
              profileStatus: ProfileStatus.success,
              userProfile: user,
              selectedPriceServiceType: user.serviceType,
            ),
          );
        }
      },
    );
  }

  Future<void> _onAvatarUpdated(
    AvatarUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        profileStatus: ProfileStatus.loading,
      ),
    );
    final res = await _profileUseCase.updateUserAvatar(
      userId: _authBloc.state.user?.userId ?? '',
      file: event.file,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.success,
            userProfile: state.userProfile?.copyWith(
              avatarUrl: res,
            ),
          ),
        );

        _authBloc.add(
          UserUpdated(
            user: _authBloc.state.user?.copyWith(
              avatarUrl: res,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onFirmSearched(
    FirmSearched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        companyStatus: CompanyStatus.loading,
      ),
    );
    final res = await _profileUseCase.searchFirm(
      query: event.query,
      limit: event.limit,
      offset: event.offset,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            failure: failure,
          ),
        );
      },
      (companies) {
        emit(
          state.copyWith(
            companyStatus: CompanyStatus.success,
            firms: companies,
          ),
        );
      },
    );
  }

  Future<void> _onExperienceAdded(
    ExperienceAdded event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        experienceStatus: ExperienceStatus.loading,
      ),
    );
    final res = await _profileUseCase.addExperience(
      userId: _authBloc.state.user?.userId ?? '',
      experienceReq: event.addExperienceReq,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            experienceStatus: ExperienceStatus.failure,
            failure: failure,
          ),
        );
      },
      (experience) {
        if (experience != null) {
          AppLogger.info('Experience added $experience');
          emit(
            state.copyWith(
              experienceStatus: ExperienceStatus.success,
              experiences: [...state.experiences, experience],
            ),
          );
        }
      },
    );
  }

  Future<void> _onEducationAdded(
    EducationAdded event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        educationStatus: EducationStatus.loading,
      ),
    );
    final res = await _profileUseCase.addEducation(
      education: event.education,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            educationStatus: EducationStatus.failure,
            failure: failure,
          ),
        );
      },
      (education) {
        if (education != null) {
          emit(
            state.copyWith(
              educationStatus: EducationStatus.success,
              educations: [...state.educations, education],
            ),
          );
        }
      },
    );
  }

  Future<void> _onUserInfoUpdated(
    UserInfoUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        userInfoStatus: UserInfoStatus.loading,
      ),
    );
    final res = await _profileUseCase.uploadUserInfo(
      uploadUserInfoReq: event.uploadUserInfoReq,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            userInfoStatus: UserInfoStatus.failure,
            failure: failure,
          ),
        );
      },
      (user) {
        if (user != null) {
          emit(
            state.copyWith(
              userInfoStatus: UserInfoStatus.success,
              userProfile: state.userProfile?.copyWith(
                firstName: user.firstName,
                lastName: user.lastName,
                averageBillingPerClient: user.averageBillingPerClient,
                caseResolutionRate: user.caseResolutionRate,
                about: user.about,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onPricingOptionSelected(
    PricingOptionSelected event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        pricingStatus: PricingStatus.initial,
        selectedPriceServiceType: event.pricinServiceType,
      ),
    );
  }

  Future<void> _onPriceAdded(
    PriceAdded event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        pricingStatus: PricingStatus.loading,
      ),
    );
    final res = await _profileUseCase.addPrice(
      price: event.price,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            pricingStatus: PricingStatus.failure,
            failure: failure,
          ),
        );
      },
      (price) {
        if (price != null) {
          AppLogger.info('prince added $price');
          emit(
            state.copyWith(
              pricingStatus: PricingStatus.success,
              userProfile: state.userProfile?.copyWith(
                priceId: price.priceId,
                serviceType: price.serviceType,
                perHourPrice: price.perHourPrice,
                perHearingPrice: price.perHearingPrice,
                contingencyPrice: price.contingencyPrice,
                hybridPrice: price.hybridPrice,
              ),
              selectedPriceServiceType: price.serviceType,
            ),
          );
        }
      },
    );
  }

  Future<void> _onPriceUpdated(
    PriceUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        pricingStatus: PricingStatus.loading,
      ),
    );
    final res = await _profileUseCase.updatePrice(
      priceId: event.priceId,
      price: event.price,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            pricingStatus: PricingStatus.failure,
            failure: failure,
          ),
        );
      },
      (price) {
        AppLogger.info('Price after update $price');
        if (price != null) {
          AppLogger.info('Profile updated successfully 3 $price');
          emit(
            state.copyWith(
              pricingStatus: PricingStatus.success,
              userProfile: state.userProfile?.copyWith(
                priceId: price.priceId,
                serviceType: price.serviceType,
                perHourPrice: price.perHourPrice,
                perHearingPrice: price.perHearingPrice,
                contingencyPrice: price.contingencyPrice,
                hybridPrice: price.hybridPrice,
              ),
              selectedPriceServiceType: price.serviceType,
            ),
          );
        }
      },
    );
  }

  Future<void> _onSocialAdded(
    SocialAdded event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        socialStatus: SocialStatus.loading,
      ),
    );

    final res = await _profileUseCase.addSocial(
      social: event.social,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            socialStatus: SocialStatus.failure,
            failure: failure,
          ),
        );
      },
      (social) {
        if (social != null) {
          emit(
            state.copyWith(
              socialStatus: SocialStatus.success,
              socials: [...state.socials, social],
            ),
          );
        }
      },
    );
  }

  Future<void> _onSocialUpdated(
    SocialUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        socialStatus: SocialStatus.loading,
      ),
    );

    final res = await _profileUseCase.updateSocial(
      socialId: event.socialId,
      social: event.social,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            socialStatus: SocialStatus.failure,
            failure: failure,
          ),
        );
      },
      (social) {
        if (social != null) {
          final updatedSocials = state.socials.map((s) {
            if (s?.socialId == social.socialId) {
              return social;
            }
            return s;
          }).toList();

          emit(
            state.copyWith(
              socialStatus: SocialStatus.success,
              socials: updatedSocials,
            ),
          );
        }
      },
    );
  }

  Future<void> _onSocialsFetched(
    SocialsFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        socialStatus: SocialStatus.loading,
      ),
    );

    final res = await _profileUseCase.fetchSocials(
      entityType: event.entityType,
      entityId: event.entityId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            socialStatus: SocialStatus.failure,
            failure: failure,
          ),
        );
      },
      (socials) {
        emit(
          state.copyWith(
            socialStatus: SocialStatus.success,
            socials: socials,
          ),
        );
      },
    );
  }

  Future<void> _onSocialDeleted(
    SocialDeleted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        socialStatus: SocialStatus.loading,
      ),
    );

    final res = await _profileUseCase.deleteSocial(
      socialId: event.socialId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            socialStatus: SocialStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        if (res != null) {
          final updatedSocials = state.socials
              .where((s) => s?.socialId != event.socialId)
              .toList();

          emit(
            state.copyWith(
              socialStatus: SocialStatus.success,
              socials: updatedSocials,
            ),
          );
        }
      },
    );
  }

  Future<void> _onReferralToggled(
    ReferralToggled event,
    Emitter<ProfileState> emit,
  ) async {
    final isOpenToReferral =
        state.userProfile?.openToReferral == true ? false : true;

    final res = await _profileUseCase.toggleReferral(
      userId: state.userProfile?.userId ?? '',
      toggleReferralReq: ToggleReferralReq(
        openToReferral: isOpenToReferral,
      ),
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.success,
            userProfile: state.userProfile?.copyWith(
              openToReferral: isOpenToReferral,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onBannerUpdated(
    BannerUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        profileStatus: ProfileStatus.loading,
      ),
    );

    final res = await _profileUseCase.updateUserBanner(
      userId: state.userProfile?.userId ?? '',
      file: event.file,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.success,
            userProfile: state.userProfile?.copyWith(
              bannerUrl: res,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onUserProfileUpdated(
    UserProfileUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        profileStatus: ProfileStatus.success,
        userProfile: event.userProfile,
      ),
    );
  }

  // profile/experiences
  Future<void> _onExperienceFetched(
    ExperienceFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        experienceStatus: ExperienceStatus.loading,
      ),
    );

    final res = await _profileUseCase.fetchExperiences(
      userId: _authBloc.state.user?.userId ?? '',
    );

    res.fold(
      (failure) {
        AppLogger.error('Error fetching experiences $failure');
        emit(
          state.copyWith(
            experienceStatus: ExperienceStatus.failure,
            failure: failure,
          ),
        );
      },
      (experiences) {
        AppLogger.info('Experiences fetched $experiences');
        emit(
          state.copyWith(
            experienceStatus: ExperienceStatus.success,
            experiences: experiences,
          ),
        );
      },
    );
  }

  Future<void> _onExperienceUpdated(
    ExperienceUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        experienceStatus: ExperienceStatus.loading,
      ),
    );

    final res = await _profileUseCase.updateExperience(
      userId: _authBloc.state.user?.userId ?? '',
      experienceId: event.experienceId,
      experienceReq: event.experienceReq,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            experienceStatus: ExperienceStatus.failure,
            failure: failure,
          ),
        );
      },
      (userExp) {
        if (userExp != null) {
          final updatedExperiences = state.experiences.map((e) {
            if (e?.experience?.experienceId ==
                userExp.experience?.experienceId) {
              return userExp;
            }
            return e;
          }).toList();

          emit(
            state.copyWith(
              experienceStatus: ExperienceStatus.success,
              experiences: updatedExperiences,
            ),
          );
        }
      },
    );
  }

  Future<void> _onExperienceDeleted(
    ExperienceDeleted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        experienceStatus: ExperienceStatus.loading,
      ),
    );

    final res = await _profileUseCase.deleteExperience(
      userId: _authBloc.state.user?.userId ?? '',
      experienceId: event.experienceId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            experienceStatus: ExperienceStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        if (res != null) {
          final updatedExperiences = state.experiences
              .where((e) => e?.experience?.experienceId != event.experienceId)
              .toList();

          emit(
            state.copyWith(
              experienceStatus: ExperienceStatus.success,
              experiences: updatedExperiences,
            ),
          );
        }
      },
    );
  }

  Future<void> _onEducationFetched(
    EducationFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        educationStatus: EducationStatus.loading,
      ),
    );

    final res = await _profileUseCase.fetchEducations(
      userId: _authBloc.state.user?.userId ?? '',
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            educationStatus: EducationStatus.failure,
            failure: failure,
          ),
        );
      },
      (educations) {
        emit(
          state.copyWith(
            educationStatus: EducationStatus.success,
            educations: educations,
          ),
        );
      },
    );
  }

  Future<void> _onEducationUpdated(
    EducationUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        educationStatus: EducationStatus.loading,
      ),
    );

    final res = await _profileUseCase.updateEducation(
      userId: _authBloc.state.user?.userId ?? '',
      educationId: event.educationId,
      education: event.education,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            educationStatus: EducationStatus.failure,
            failure: failure,
          ),
        );
      },
      (education) {
        if (education != null) {
          final updatedEducations = state.educations.map((e) {
            if (e?.educationId == education.educationId) {
              return education;
            }
            return e;
          }).toList();

          emit(
            state.copyWith(
              educationStatus: EducationStatus.success,
              educations: updatedEducations,
            ),
          );
        }
      },
    );
  }

  Future<void> _onEducationDeleted(
    EducationDeleted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        educationStatus: EducationStatus.loading,
      ),
    );

    final res = await _profileUseCase.deleteEducation(
      userId: _authBloc.state.user?.userId ?? '',
      educationId: event.educationId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            educationStatus: EducationStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        if (res != null) {
          final updatedEducations = state.educations
              .where((e) => e?.educationId != event.educationId)
              .toList();

          emit(
            state.copyWith(
              educationStatus: EducationStatus.success,
              educations: updatedEducations,
            ),
          );
        }
      },
    );
  }

  Future<void> _onFeaturePostsFetched(
    FeaturePostsFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        profileStatus: ProfileStatus.loading,
      ),
    );

    final res = await _profileUseCase.fetchFeaturePosts(
      userId: event.userId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (featurePosts) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.success,
            featurePosts: featurePosts,
          ),
        );
      },
    );
  }

  Future<void> _onFeaturePostUnsaved(
    FeaturePostUnsaved event,
    Emitter<ProfileState> emit,
  ) async {
    final response = await _profileUseCase.unsaveFeaturePost(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            profileStatus: ProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (res) {
        if (res != null) {
          final updatedFeaturePosts = state.featurePosts
              .where((featurePost) => featurePost.post?.postId != event.postId)
              .toList();

          emit(
            state.copyWith(
              profileStatus: ProfileStatus.success,
              featurePosts: updatedFeaturePosts,
            ),
          );
        }
      },
    );
  }
}
