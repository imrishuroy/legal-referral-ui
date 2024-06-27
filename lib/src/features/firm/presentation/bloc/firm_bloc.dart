
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'firm_event.dart';
part 'firm_state.dart';

class FirmBloc extends Bloc<FirmEvent, FirmState> {
  FirmBloc() : super(FirmInitial()) {
    on<FirmEvent>((event, emit) {

    });
  }
}
