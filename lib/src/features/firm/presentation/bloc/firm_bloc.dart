import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/firm/data/data.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

part 'firm_event.dart';
part 'firm_state.dart';

@injectable
class FirmBloc extends Bloc<FirmEvent, FirmState> {
  FirmBloc({
    required FirmUseCase firmUsecase,
    required ProfileUseCase profileUseCase,
  })  : _firmUseCase = firmUsecase,
        _profileUseCase = profileUseCase,
        super(FirmState.initial()) {
    on<FirmAdded>(_onFirmAdded);
    on<MyFirmsFetched>(_onMyFirmsFetched);
    on<SocialMediaFieldAdded>(_onSocialMediaFieldAdded);
    on<SocialMediaEntered>(_onSocialMediaEntered);
    on<SocialMediaPlatformSelected>(_onSocialMediaPlatformSelected);
    on<SocialLinkChanged>(_onSocialLinkChanged);
    on<FirmLogoFileSelected>(_onFirmLogoFileSelected);
    on<FirmLogoFileDeleted>(_onFirmLogoFileDeleted);
    on<FirmSocialMediaAdded>(_onFirmSocialMediaAdded);
    on<FirmSocialsFetched>(_onFirmSocialsFetched);
  }

  final FirmUseCase _firmUseCase;
  final ProfileUseCase _profileUseCase;

  Future<void> _onFirmAdded(
    FirmAdded event,
    Emitter<FirmState> emit,
  ) async {
    if (state.pickedFile == null) {
      return;
    }

    emit(state.copyWith(status: FirmStatus.loading));

    final result = await _firmUseCase.addFirm(
      firm: event.firm,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FirmStatus.failure,
        ),
      ),
      (firm) {
        final myFirms = List<Firm>.from(state.myFirms)..add(firm);
        emit(
          state.copyWith(
            myFirms: myFirms,
          ),
        );

        add(FirmSocialMediaAdded());
      },
    );
  }

  Future<void> _onMyFirmsFetched(
    MyFirmsFetched event,
    Emitter<FirmState> emit,
  ) async {
    emit(state.copyWith(status: FirmStatus.loading));
    final result = await _firmUseCase.fetchMyFirms(
      ownerId: event.ownerId,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FirmStatus.failure,
        ),
      ),
      (firms) {
        emit(
          state.copyWith(
            myFirms: firms,
            status: FirmStatus.success,
          ),
        );
      },
    );
  }

  void _onSocialMediaFieldAdded(
    SocialMediaFieldAdded event,
    Emitter<FirmState> emit,
  ) {
    emit(
      state.copyWith(
        socialMedias: [
          ...state.socialMedias,
          const SocialMedia(
            platform: SocialPlatform.none,
            url: '',
          ),
        ],
      ),
    );
  }

  void _onSocialMediaEntered(
    SocialMediaEntered event,
    Emitter<FirmState> emit,
  ) {
    final socialMedias = List<SocialMedia>.from(state.socialMedias);
    socialMedias[event.index] = event.socialMedia;
    emit(
      state.copyWith(
        socialMedias: socialMedias,
      ),
    );
  }

  void _onSocialMediaPlatformSelected(
    SocialMediaPlatformSelected event,
    Emitter<FirmState> emit,
  ) {
    final socialMedias = List<SocialMedia>.from(state.socialMedias);
    final socialMedia = socialMedias[event.index];

    final updatedSocialMedia = socialMedia.copyWith(
      platform: event.platform,
    );

    socialMedias[event.index] = updatedSocialMedia;
    emit(
      state.copyWith(
        socialMedias: socialMedias,
      ),
    );
  }

  void _onSocialLinkChanged(
    SocialLinkChanged event,
    Emitter<FirmState> emit,
  ) {
    final socialMedias = List<SocialMedia>.from(state.socialMedias);
    final socialMedia = socialMedias[event.index];

    final updatedSocialMedia = socialMedia.copyWith(
      url: event.url,
    );

    socialMedias[event.index] = updatedSocialMedia;
    emit(
      state.copyWith(
        socialMedias: socialMedias,
      ),
    );
  }

  Future<void> _onFirmLogoFileSelected(
    FirmLogoFileSelected event,
    Emitter<FirmState> emit,
  ) async {
    final pickedFile = await ImageUtil.pickImage(
      cropStyle: CropStyle.circle,
    );

    emit(
      state.copyWith(
        pickedFile: pickedFile,
      ),
    );
  }

  void _onFirmLogoFileDeleted(
    FirmLogoFileDeleted event,
    Emitter<FirmState> emit,
  ) {
    emit(
      FirmState(
        myFirms: state.myFirms,
        socialMedias: state.socialMedias,
        status: state.status,
        failure: state.failure,
      ),
    );
  }

  Future<void> _onFirmSocialMediaAdded(
    FirmSocialMediaAdded event,
    Emitter<FirmState> emit,
  ) async {
    emit(state.copyWith(status: FirmStatus.loading));

    final firmSocials = state.socialMedias
        .map(
          (social) => Social(
            platform: social.platform,
            entityType: EntityType.firm,
            link: social.url,
          ),
        )
        .toList();

    final addSocialFutures = firmSocials.map(
      (social) => _profileUseCase.addSocial(social: social),
    );

    final responses = await Future.wait(addSocialFutures);

    for (final response in responses) {
      final failure = response.fold((failure) => failure, (_) => null);

      if (failure != null) {
        emit(state.copyWith(status: FirmStatus.failure));
        return;
      }
    }

    emit(
      state.copyWith(
        status: FirmStatus.firmAdded,
      ),
    );
  }

  Future<void> _onFirmSocialsFetched(
    FirmSocialsFetched event,
    Emitter<FirmState> emit,
  ) async {
    emit(state.copyWith(status: FirmStatus.loading));

    final result = await _profileUseCase.fetchSocials(
      entityType: EntityType.firm,
      entityId: event.userId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FirmStatus.failure,
        ),
      ),
      (socials) {
        emit(
          state.copyWith(
            socials: socials,
            status: FirmStatus.success,
          ),
        );
      },
    );
  }
}
