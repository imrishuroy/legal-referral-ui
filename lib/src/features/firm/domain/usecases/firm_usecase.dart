import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/firm/data/data.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';

@lazySingleton
class FirmUseCase {
  FirmUseCase({
    required FirmRepository firmRepository,
  }) : _firmRepository = firmRepository;

  final FirmRepository _firmRepository;

  Future<Either<Failure, Firm>> addFirm({
    required AddFirmReq firm,
  }) async {
    return _firmRepository.addFirm(
      firm: firm,
    );
  }

  Future<Either<Failure, List<Firm>>> fetchMyFirms({
    required String ownerId,
  }) async {
    return _firmRepository.fetchMyFirms(
      ownerId: ownerId,
    );
  }
}
