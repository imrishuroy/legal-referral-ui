import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';

class WizardDataSource {
  WizardDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<int?> getWizardStep({
    required String userId,
  }) async {
    try {
      return await _apiClient.getWizardStep(
        userId,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMsg?> sendMobileOtp({
    required SendMobileOtpReq sendMobileOtpReq,
  }) async {
    try {
      return await _apiClient.sendMobileOtp(
        sendMobileOtpReq,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMsg?> verifyMobileOtp({
    required VerifyMobileOtpReq verifyMobileOtpReq,
  }) async {
    try {
      return await _apiClient.verifyMobileOtp(
        verifyMobileOtpReq,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<License?> saveLicense({
    required License license,
  }) async {
    try {
      return await _apiClient.saveLicense(
        license,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMsg?> saveAboutYou({
    required AboutYouReq aboutYouReq,
  }) async {
    try {
      return await _apiClient.saveAboutYou(
        aboutYouReq,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMsg?> uploadProfileImage({
    required UploadUserImageReq uploadUserImageReq,
  }) async {
    try {
      return await _apiClient.uploadProfileImage(
        uploadUserImageReq.userId,
        uploadUserImageReq,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMsg?> uploadLicense({
    required UploadLicenseReq uploadLicenseReq,
  }) async {
    try {
      return await _apiClient.uploadLicense(
        uploadLicenseReq,
      );
    } catch (error) {
      rethrow;
    }
  }
}
