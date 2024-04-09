import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_check_event.dart';
part 'internet_check_state.dart';

class InternetCheckBloc extends Bloc<InternetCheckEvent, InternetCheckState> {
  InternetCheckBloc() : super(InternetCheckState.initial()) {
    // final result = Connectivity().checkConnectivity();
    on<CheckConnectivity>((event, emit) {
      Connectivity().onConnectivityChanged.listen((event) {
        if (event[0] == ConnectivityResult.none) {
          emit(
            state.copyWith(
              internetStatus: InternetCheck.disconnected,
              connectionMessage: 'Check internet connection',
            ),
          );
        } else {
          emit(
            state.copyWith(
              internetStatus: InternetCheck.connected,
              connectionMessage: 'Connecteed to internet',
            ),
          );
        }
      });
    });
  }
}
