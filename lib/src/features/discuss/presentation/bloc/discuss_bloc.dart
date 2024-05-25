import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'discuss_event.dart';
part 'discuss_state.dart';

class DiscussBloc extends Bloc<DiscussEvent, DiscussState> {
  DiscussBloc() : super(DiscussInitial()) {
    on<DiscussEvent>((event, emit) {});
  }
}
