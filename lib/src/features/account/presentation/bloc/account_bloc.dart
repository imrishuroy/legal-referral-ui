import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/account/domain/domain.dart';

part 'account_event.dart';
part 'account_state.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required AccountUsecase accountUsecase})
      : _accountUsecase = accountUsecase,
        super(AccountState.initial()) {
    on<FAQFetched>(_onFAQFetched);
    on<FAQCreated>(_onFAQCreated);
  }

  final AccountUsecase _accountUsecase;

  Future<void> _onFAQFetched(
    FAQFetched event,
    Emitter<AccountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AccountStatus.loading,
      ),
    );

    final response = await _accountUsecase.fetchFAQs();

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AccountStatus.failure,
            failure: failure,
          ),
        );
      },
      (faqs) {
        emit(
          state.copyWith(
            status: AccountStatus.success,
            faqs: faqs,
          ),
        );
      },
    );
  }

  Future<void> _onFAQCreated(
    FAQCreated event,
    Emitter<AccountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AccountStatus.loading,
      ),
    );

    final response = await _accountUsecase.createFAQ(
      faq: event.faq,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AccountStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            status: AccountStatus.success,
          ),
        );
      },
    );
  }
}
