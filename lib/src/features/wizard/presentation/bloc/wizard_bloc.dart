import 'dart:io' as io;

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    on<LicenseSaved>(_onLicenseSaved);
    on<AboutYouSaved>(_onAboutYouSaved);
    on<UserImageUploaded>(_onUserImageUploaded);
    on<SocialSaved>(_onSocialSaved);
    on<LicenseUploaded>(_onLicenseUploaded);
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
      UserImageUploaded(
        userId: event.userId,
        file: event.file,
      ),
    );
  }

  Future<void> _onUserImageUploaded(
    UserImageUploaded event,
    Emitter<WizardState> emit,
  ) async {
    try {
      final imageUrl = await _uploadFile(
        file: event.file,
        filename: event.userId,
        container: 'user_images',
        fileType: 'jpg',
      );
      AppLogger.info('Image URL: $imageUrl');
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

      final response = await _wizardUseCase.uploadUserImage(
        uploadUserImageReq: UploadUserImageReq(
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
              wizardStep: WizardStep.license,
            ),
          );
        },
      );
    } catch (error) {
      AppLogger.error('Error uploading profile image: $error');
      emit(
        state.copyWith(
          wizardStatus: WizardStatus.failure,
          failure: Failure(
            message: error.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _onLicenseUploaded(
    LicenseUploaded event,
    Emitter<WizardState> emit,
  ) async {
    emit(
      state.copyWith(
        wizardStatus: WizardStatus.loading,
      ),
    );

    final licenseUrl = await _uploadFile(
      file: XFile(event.filePath),
      filename: event.userId,
      container: 'licenses',
      fileType: 'pdf',
    );
    AppLogger.info('License URL: $licenseUrl');
    if (licenseUrl == null) {
      emit(
        state.copyWith(
          wizardStatus: WizardStatus.failure,
          failure: const Failure(
            message: 'Failed to upload license',
          ),
        ),
      );
      return;
    }

    final response = await _wizardUseCase.uploadLicense(
      uploadLicenseReq: UploadLicenseReq(
        userId: event.userId,
        licensePdf: licenseUrl,
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
            wizardStep: WizardStep.aboutYou,
          ),
        );
      },
    );
  }

  WizardStep _wizardStep(int step) {
    switch (step) {
      case 0:
        return WizardStep.socialAvatar;
      case 1:
        return WizardStep.license;
      case 2:
        return WizardStep.uploadLicense;
      case 3:
        return WizardStep.aboutYou;
      default:
        return WizardStep.socialAvatar;
    }
  }

  Future<UserCredential?> _createUser({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userCred = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCred;
    } catch (error) {
      AppLogger.error('Error creating user: $error');
    }
    return null;
  }

  /// The user selects a file, and the task is added to the list.
  Future<String?> _uploadFile({
    required XFile file,
    required String filename,
    required String container,
    required String fileType,
  }) async {
    try {
      String? downloadUrl;

      // Create a Reference to the file
      final ref = FirebaseStorage.instance
          .ref()
          .child(container)
          .child('/$filename.$fileType');

      AppLogger.info('file path: ${file.path}');

      final metadata = SettableMetadata(
        contentType: fileType == 'pdf' ? 'application/pdf' : 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );

      final uploadTask = await ref.putFile(io.File(file.path), metadata);

      await Future.delayed(const Duration(seconds: 5));
      if (uploadTask.state == TaskState.success) {
        downloadUrl = await uploadTask.ref.getDownloadURL();
      }
      return downloadUrl;
    } catch (error) {
      AppLogger.error('Error uploading file: $error');
      return null;
    }
  }
}
