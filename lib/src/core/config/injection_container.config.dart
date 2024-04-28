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
    as _i18;
import '../../features/auth/domain/domain.dart' as _i17;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i19;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i23;
import '../../features/auth/presentation/presentation.dart' as _i26;
import '../../features/network/data/data.dart' as _i13;
import '../../features/network/data/datasource/network_datasource.dart' as _i6;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i12;
import '../../features/network/domain/domain.dart' as _i11;
import '../../features/network/domain/usecases/network_usecase.dart' as _i22;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i27;
import '../../features/profile/data/data.dart' as _i16;
import '../../features/profile/data/datasources/profile_datasource.dart' as _i8;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i15;
import '../../features/profile/domain/domain.dart' as _i14;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i20;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i25;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i10;
import '../../features/wizard/domain/domain.dart' as _i9;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i21;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i24;
import '../network/api_client.dart' as _i7;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i28;

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
    gh.singleton<_i6.NetworkDataSource>(
        () => _i6.NetworkDataSource(apiClient: gh<_i7.APIClient>()));
    gh.singleton<_i8.ProfileDataSource>(
        () => _i8.ProfileDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i9.WizardRepository>(() => _i10.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i11.NetworkRepository>(() => _i12.NetworkRepositoryImpl(
        networkDataSource: gh<_i13.NetworkDataSource>()));
    gh.lazySingleton<_i14.ProfileRepository>(() => _i15.ProfileRepositoryImpl(
        profileDataSource: gh<_i16.ProfileDataSource>()));
    gh.lazySingleton<_i17.AuthRepository>(() =>
        _i18.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i19.AuthUseCase>(
        () => _i19.AuthUseCase(authRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i20.ProfileUseCase>(() =>
        _i20.ProfileUseCase(profileRepository: gh<_i14.ProfileRepository>()));
    gh.lazySingleton<_i21.WizardUseCase>(
        () => _i21.WizardUseCase(wizardRepository: gh<_i9.WizardRepository>()));
    gh.lazySingleton<_i22.NetworkUseCase>(() =>
        _i22.NetworkUseCase(networkRepository: gh<_i11.NetworkRepository>()));
    gh.lazySingleton<_i23.AuthBloc>(
        () => _i23.AuthBloc(authUseCase: gh<_i17.AuthUseCase>()));
    gh.factory<_i24.WizardBloc>(
        () => _i24.WizardBloc(wizardUseCase: gh<_i21.WizardUseCase>()));
    gh.factory<_i25.ProfileBloc>(() => _i25.ProfileBloc(
          authBloc: gh<_i26.AuthBloc>(),
          profileUseCase: gh<_i20.ProfileUseCase>(),
        ));
    gh.factory<_i27.NetworkBloc>(
        () => _i27.NetworkBloc(networkUseCase: gh<_i11.NetworkUseCase>()));
    return this;
  }
}

class _$APIClientModule extends _i28.APIClientModule {}
