import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_details_event.dart';
part 'more_details_state.dart';

class MoreDetailsBloc extends Bloc<MoreDetailsEvent, MoreDetailsState> {
  MoreDetailsBloc() : super(MoreDetailsInitial()) {
    on<MoreDetailsEvent>((event, emit) {});
  }
}
