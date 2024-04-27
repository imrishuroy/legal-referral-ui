import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_check_event.dart';
part 'internet_check_state.dart';

class InternetCheckBloc extends Bloc<InternetCheckEvent, InternetCheckState> {
  InternetCheckBloc() : super(InternetCheckState.initial()) {
    final connectivity = Connectivity();
    on<CheckConnectivity>(
      (event, emit) async {
        final connectivityResult = await connectivity.checkConnectivity();

        _mapConnectivityResultToState(
          connectivityResult,
          emit,
        );
        connectivity.onConnectivityChanged.listen(
          (result) {
            _mapConnectivityResultToState(
              result,
              emit,
            );
          },
        );
      },
    );
  }

  void _mapConnectivityResultToState(
    List<ConnectivityResult> result,
    Emitter<InternetCheckState> emit,
  ) {
    for (final connectivityresult in result) {
      if (connectivityresult == ConnectivityResult.none) {
        emit(
          state.copyWith(
            internetStatus: InternetCheck.disconnected,
          ),
        );
      } else {
        emit(
          state.copyWith(
            internetStatus: InternetCheck.connected,
          ),
        );
      }
    }
  }
}
