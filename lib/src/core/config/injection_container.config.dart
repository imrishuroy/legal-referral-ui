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
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i13;
import '../../features/auth/domain/domain.dart' as _i12;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i14;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i17;
import '../../features/auth/presentation/presentation.dart' as _i20;
import '../../features/profile/data/data.dart' as _i11;
import '../../features/profile/data/datasources/profile_datasource.dart' as _i6;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i10;
import '../../features/profile/domain/domain.dart' as _i9;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i15;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i19;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i8;
import '../../features/wizard/domain/domain.dart' as _i7;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i16;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i18;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i21;

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
    gh.singleton<_i6.ProfileDataSource>(
        () => _i6.ProfileDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i7.WizardRepository>(() =>
        _i8.WizardRepositoryImpl(wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i9.ProfileRepository>(() => _i10.ProfileRepositoryImpl(
        profileDataSource: gh<_i11.ProfileDataSource>()));
    gh.lazySingleton<_i12.AuthRepository>(() =>
        _i13.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i14.AuthUseCase>(
        () => _i14.AuthUseCase(authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i15.ProfileUseCase>(() =>
        _i15.ProfileUseCase(profileRepository: gh<_i9.ProfileRepository>()));
    gh.lazySingleton<_i16.WizardUseCase>(
        () => _i16.WizardUseCase(wizardRepository: gh<_i7.WizardRepository>()));
    gh.lazySingleton<_i17.AuthBloc>(
        () => _i17.AuthBloc(authUseCase: gh<_i12.AuthUseCase>()));
    gh.factory<_i18.WizardBloc>(
        () => _i18.WizardBloc(wizardUseCase: gh<_i16.WizardUseCase>()));
    gh.factory<_i19.ProfileBloc>(() => _i19.ProfileBloc(
          authBloc: gh<_i20.AuthBloc>(),
          profileUseCase: gh<_i15.ProfileUseCase>(),
        ));
    return this;
  }
}

class _$APIClientModule extends _i21.APIClientModule {}
