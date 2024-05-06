import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'referral_event.dart';
part 'referral_state.dart';

class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  ReferralBloc() : super(ReferralInitial()) {
    on<ReferralEvent>((event, emit) {});
  }
}
