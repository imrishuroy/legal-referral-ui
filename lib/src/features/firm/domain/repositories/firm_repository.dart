import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/firm/data/data.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';

abstract class FirmRepository {
  Future<Either<Failure, Firm>> addFirm({required AddFirmReq firm});

  Future<Either<Failure, List<Firm>>> fetchMyFirms({
    required String ownerId,
  });
}
