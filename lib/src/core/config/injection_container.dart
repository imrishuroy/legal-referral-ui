import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/injection_container.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  generateForDir: ['lib'],
)
void configureDependencies() => getIt.init();
