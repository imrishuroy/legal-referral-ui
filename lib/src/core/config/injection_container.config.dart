// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/data.dart' as _i4;
import '../../features/auth/data/repositories/auth_repository_impl.dart' as _i9;
import '../../features/auth/domain/domain.dart' as _i8;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i10;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i12;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i7;
import '../../features/wizard/domain/domain.dart' as _i6;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i11;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i13;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final aPIClientModule = _$APIClientModule();
    gh.singleton<_i3.APIClient>(() => aPIClientModule.apiClient());
    gh.singleton<_i4.AuthDataSource>(() => aPIClientModule.authDataSource());
    gh.singleton<_i5.WizardDataSource>(
        () => aPIClientModule.wizardDataSource());
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i6.WizardRepository>(() =>
        _i7.WizardRepositoryImpl(wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i8.AuthRepository>(
        () => _i9.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i10.AuthUseCase>(
        () => _i10.AuthUseCase(authRepository: gh<_i8.AuthRepository>()));
    gh.lazySingleton<_i11.WizardUseCase>(
        () => _i11.WizardUseCase(wizardRepository: gh<_i6.WizardRepository>()));
    gh.singleton<_i12.AuthBloc>(
        () => _i12.AuthBloc(authUseCase: gh<_i8.AuthUseCase>()));
    gh.factory<_i13.WizardBloc>(
        () => _i13.WizardBloc(wizardUseCase: gh<_i11.WizardUseCase>()));
    return this;
  }
}

class _$APIClientModule extends _i14.APIClientModule {}
