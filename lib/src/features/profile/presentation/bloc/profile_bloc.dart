import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/domain/usecases/profile_usecase.dart';
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
    required ProfileUseCase profileUseCase,
  })  : _profileUseCase = profileUseCase,
        super(ProfileState.initial()) {
    on<ProfileFetched>(_onProfileFetched);
    on<FirmSearched>(_onFirmSearched, transformer: debounce(_duration));
    on<ExperienceAdded>(_onExperienceAdded);
    on<EducationAdded>(_onEducationAdded);
    on<UserInfoUpdated>(_onUserInfoUpdated);
    on<PricingOptionSelected>(_onPricingOptionSelected);
    on<PriceAdded>(_onPriceAdded);
    on<PriceUpdated>(_onPriceUpdated);
    on<SocialAdded>(_onSocialAdded);
    on<ReferralToggled>(_onReferralToggled);
    on<BannerUpdated>(_onBannerUpdated);
    on<UserProfileUpdated>(_onUserProfileUpdated);
  }

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
      addExperienceReq: event.addExperienceReq,
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
        profileStatus: ProfileStatus.loading,
      ),
    );
    final res = await _profileUseCase.uploadUserInfo(
      uploadUserInfoReq: event.uploadUserInfoReq,
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
        profileStatus: ProfileStatus.loading,
      ),
    );

    final res = await _profileUseCase.addSocial(
      social: event.social,
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
      (social) {
        if (social != null) {
          emit(
            state.copyWith(
              profileStatus: ProfileStatus.success,
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
}
