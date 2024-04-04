import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.info('${bloc.runtimeType} $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.info('Event happened in $bloc with event $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    AppLogger.info(
      'There was a transition of ${bloc.runtimeType} from '
      '${transition.currentState} to ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error(
      'Error happened in ${bloc.runtimeType} with error $error '
      'and the stacktrace is $stackTrace',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.info('${bloc.runtimeType} is closed');
  }
}
