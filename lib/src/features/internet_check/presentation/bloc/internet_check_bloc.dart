import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_check_event.dart';
part 'internet_check_state.dart';

class InternetCheckBloc extends Bloc<InternetCheckEvent, InternetCheckState> {
  InternetCheckBloc() : super(InternetCheckState.initial()) {
    on<InternetCheckStream>(
      (event, emit)  {
        _streamSubscription = Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> result) {
            final hasInternet = result.first != ConnectivityResult.none;

            if (result.isEmpty || !hasInternet) {
          
              emit(
                state.copyWith(
                  internetStatus: InternetCheck.disconnected,
                  hasInternet: hasInternet,
                ),
              );
            } else {
              
              emit(
                state.copyWith(
                  internetStatus: InternetCheck.connected,
                  hasInternet: hasInternet,
                ),
              );
            }
          },
        );
      },
    );
  }
  late StreamSubscription<List<ConnectivityResult>> _streamSubscription;
  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
