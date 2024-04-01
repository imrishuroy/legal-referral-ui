import 'dart:io' as io;

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/usecases/wizard_usecase.dart';

part 'wizard_event.dart';
part 'wizard_state.dart';

@injectable
class WizardBloc extends Bloc<WizardEvent, WizardState> {
  WizardBloc({
    required WizardUseCase wizardUseCase,
  })  : _wizardUseCase = wizardUseCase,
        super(WizardState.initial()) {
    on<WizardStepFetched>(_onWizardStepFetched);
    on<WizardStepChanged>(_onWizardStepChanged);
    on<MobileOtpSent>(_onMobileOtpSent);
    on<MobileOtpVerified>(_onMobileOtpVerified);
    on<LicenseSaved>(_onLicenseSaved);
    on<AboutYouSaved>(_onAboutYouSaved);
    on<ProfileImageUploaded>(_onProfileImageUploaded);
    on<SocialSaved>(_onSocialSaved);
  }

  final WizardUseCase _wizardUseCase;

  Future<void> _onWizardStepFetched(
    WizardStepFetched event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStepStatus: WizardStepStatus.wizardStepLoading,
      ),
    );

    final response = await _wizardUseCase.getWizardStep(
      userId: event.userId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (step) {
        AppLogger.info('Wizard step: $step');
        final wizardStep = _wizardStep(step ?? 0);

        emit(
          state.copyWith(
            wizardStep: wizardStep,
            wizardStepStatus: WizardStepStatus.wizardStepLoaded,
          ),
        );
      },
    );
  }

  Future<void> _onWizardStepChanged(
    WizardStepChanged event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStep: event.wizardStep,
      ),
    );
  }

  Future<void> _onMobileOtpSent(
    MobileOtpSent event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.sendMobileOtp(
      sendMobileOtpReq: SendMobileOtpReq(
        mobile: event.mobile,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            mobileOtpStatus: MobileOtpStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            mobileOtpStatus: MobileOtpStatus.sent,
          ),
        );
      },
    );
  }

  Future<void> _onMobileOtpVerified(
    MobileOtpVerified event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        mobileOtpStatus: MobileOtpStatus.verifying,
      ),
    );

    if (event.userId == null) {
      emit(
        state.copyWith(
          wizardStatus: WizardStatus.failure,
          mobileOtpStatus: MobileOtpStatus.failed,
          failure: const Failure(
            message: 'Failed to verify OTP',
          ),
        ),
      );
      return;
    }

    final response = await _wizardUseCase.verifyMobileOtp(
      verifyMobileOtpReq: VerifyMobileOtpReq(
        userId: event.userId!,
        mobile: event.mobile,
        otp: event.otp,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            mobileOtpStatus: MobileOtpStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            mobileOtpStatus: MobileOtpStatus.verified,
          ),
        );
      },
    );
  }

  Future<void> _onLicenseSaved(
    LicenseSaved event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.saveLicense(
      license: event.license,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            wizardStep: WizardStep.aboutYou,
          ),
        );
      },
    );
  }

  Future<void> _onAboutYouSaved(
    AboutYouSaved event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final response = await _wizardUseCase.saveAboutYou(
      aboutYouReq: event.aboutYouReq,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            wizardStep: WizardStep.socialAvatar,
          ),
        );
      },
    );
  }

  Future<void> _onSocialSaved(
    SocialSaved event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    await _createUser(
      email: event.email,
      password: event.password,
    );

    add(
      ProfileImageUploaded(
        userId: event.userId,
        file: event.file,
      ),
    );
  }

  Future<void> _onProfileImageUploaded(
    ProfileImageUploaded event,
    Emitter<WizardState> emit,
  ) async {
    // emit(
    //   state.copyWith(
    //     wizardStatus: WizardStatus.loading,
    //   ),
    // );

    final uploadTask = await uploadFile(
      file: event.file,
      filename: event.userId,
    );
    final imageUrl = await uploadTask?.snapshot.ref.getDownloadURL();
    if (imageUrl == null) {
      emit(
        state.copyWith(
          wizardStatus: WizardStatus.failure,
          failure: const Failure(
            message: 'Failed to upload profile image',
          ),
        ),
      );
      return;
    }

    final response = await _wizardUseCase.uploadProfileImage(
      uploadProfileImageReq: UploadProfileImageReq(
        userId: event.userId,
        imageUrl: imageUrl,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            wizardStatus: WizardStatus.success,
            wizardStep: WizardStep.uploadLicense,
          ),
        );
      },
    );
  }

  WizardStep _wizardStep(int step) {
    switch (step) {
      case 1:
        return WizardStep.socialAvatar;
      case 2:
        return WizardStep.uploadLicense;
      case 3:
        return WizardStep.license;
      case 4:
        return WizardStep.aboutYou;
      // case 5:
      //   return WizardStep.experience;
      // case 6:
      //   return WizardStep.education;
      // case 7:
      //   return WizardStep.social;
      // case 8:
      //   return WizardStep.pricing;
      default:
        return WizardStep.contact;
    }
  }

  Future<UserCredential?> _createUser({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      AppLogger.error('Error creating user: $error');
    }
    return null;
  }

  /// The user selects a file, and the task is added to the list.
  Future<UploadTask?> uploadFile({
    required XFile file,
    required String filename,
  }) async {
    UploadTask uploadTask;

    // Create a Reference to the file
    final ref = FirebaseStorage.instance
        .ref()
        .child('social-avatar')
        .child('$filename.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }
}
