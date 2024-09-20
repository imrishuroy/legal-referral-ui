import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/account/domain/domain.dart';

@lazySingleton
class AccountUsecase {
  AccountUsecase({
    required AccountRepository accountRepository,
  }) : _accountRepository = accountRepository;

  final AccountRepository _accountRepository;

  Future<Either<Failure, List<FAQ>>> fetchFAQs() async {
    try {
      final response = await _accountRepository.fetchFAQs();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Failure, FAQ>> createFAQ({
    required FAQ faq,
  }) async {
    try {
      final response = await _accountRepository.createFAQ(
        faq: faq,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
