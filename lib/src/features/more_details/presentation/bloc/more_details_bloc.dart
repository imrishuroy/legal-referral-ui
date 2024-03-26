import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'more_details_event.dart';
part 'more_details_state.dart';

class MoreDetailsBloc extends Bloc<MoreDetailsEvent, MoreDetailsState> {
  MoreDetailsBloc() : super(MoreDetailsInitial()) {
    on<MoreDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
