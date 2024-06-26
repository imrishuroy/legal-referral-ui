
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

class AdvertisementBloc extends Bloc<AdvertisementEvent, AdvertisementState> {
  AdvertisementBloc() : super(AdvertisementInitial()) {
    on<AdvertisementEvent>((event, emit) {

    });
  }
}
