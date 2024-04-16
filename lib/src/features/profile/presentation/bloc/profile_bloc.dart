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
    on<FirmSearched>(_onFirmSearched, transformer: debounce(_duration));
    on<ExperienceAdded>(_onExperienceAdded);
    on<EducationAdded>(_onEducationAdded);
    on<UserInfoUpdated>(_onUserInfoUpdated);
  }

  final ProfileUseCase _profileUseCase;

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
}
