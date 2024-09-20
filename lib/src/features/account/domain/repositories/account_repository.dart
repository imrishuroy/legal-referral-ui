import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/account/domain/domain.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<FAQ>>> fetchFAQs();

  Future<Either<Failure, FAQ>> createFAQ({
    required FAQ faq,
  });
}
