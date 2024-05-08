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
    as _i19;
import '../../features/auth/domain/domain.dart' as _i18;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i20;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i24;
import '../../features/auth/presentation/presentation.dart' as _i27;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i6;
import '../../features/network/data/data.dart' as _i14;
import '../../features/network/data/datasource/network_datasource.dart' as _i7;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i13;
import '../../features/network/domain/domain.dart' as _i12;
import '../../features/network/domain/usecases/network_usecase.dart' as _i23;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i28;
import '../../features/profile/data/data.dart' as _i17;
import '../../features/profile/data/datasources/profile_datasource.dart' as _i9;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i16;
import '../../features/profile/domain/domain.dart' as _i15;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i21;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i26;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i11;
import '../../features/wizard/domain/domain.dart' as _i10;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i22;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i25;
import '../network/api_client.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i29;

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
    gh.singleton<_i6.ChatBloc>(() => _i6.ChatBloc());
    gh.singleton<_i7.NetworkDataSource>(
        () => _i7.NetworkDataSource(apiClient: gh<_i8.APIClient>()));
    gh.singleton<_i9.ProfileDataSource>(
        () => _i9.ProfileDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i10.WizardRepository>(() => _i11.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i12.NetworkRepository>(() => _i13.NetworkRepositoryImpl(
        networkDataSource: gh<_i14.NetworkDataSource>()));
    gh.lazySingleton<_i15.ProfileRepository>(() => _i16.ProfileRepositoryImpl(
        profileDataSource: gh<_i17.ProfileDataSource>()));
    gh.lazySingleton<_i18.AuthRepository>(() =>
        _i19.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i20.AuthUseCase>(
        () => _i20.AuthUseCase(authRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i21.ProfileUseCase>(() =>
        _i21.ProfileUseCase(profileRepository: gh<_i15.ProfileRepository>()));
    gh.lazySingleton<_i22.WizardUseCase>(() =>
        _i22.WizardUseCase(wizardRepository: gh<_i10.WizardRepository>()));
    gh.lazySingleton<_i23.NetworkUseCase>(() =>
        _i23.NetworkUseCase(networkRepository: gh<_i12.NetworkRepository>()));
    gh.lazySingleton<_i24.AuthBloc>(
        () => _i24.AuthBloc(authUseCase: gh<_i18.AuthUseCase>()));
    gh.factory<_i25.WizardBloc>(
        () => _i25.WizardBloc(wizardUseCase: gh<_i22.WizardUseCase>()));
    gh.factory<_i26.ProfileBloc>(() => _i26.ProfileBloc(
          authBloc: gh<_i27.AuthBloc>(),
          profileUseCase: gh<_i21.ProfileUseCase>(),
        ));
    gh.factory<_i28.NetworkBloc>(
        () => _i28.NetworkBloc(networkUseCase: gh<_i12.NetworkUseCase>()));
    return this;
  }
}

class _$APIClientModule extends _i29.APIClientModule {}
