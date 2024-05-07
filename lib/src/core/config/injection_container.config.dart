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
    as _i22;
import '../../features/auth/domain/domain.dart' as _i21;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i23;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i27;
import '../../features/auth/presentation/presentation.dart' as _i32;
import '../../features/network/data/data.dart' as _i14;
import '../../features/network/data/datasource/network_datasource.dart' as _i6;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i13;
import '../../features/network/domain/domain.dart' as _i12;
import '../../features/network/domain/usecases/network_usecase.dart' as _i26;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i33;
import '../../features/profile/data/data.dart' as _i17;
import '../../features/profile/data/datasources/profile_datasource.dart' as _i8;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i16;
import '../../features/profile/domain/domain.dart' as _i15;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i24;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i31;
import '../../features/search/data/data.dart' as _i20;
import '../../features/search/data/datasources/search_datasource.dart' as _i9;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i19;
import '../../features/search/domain/domain.dart' as _i29;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i18;
import '../../features/search/domain/usecases/search_usecase.dart' as _i28;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i34;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i11;
import '../../features/wizard/domain/domain.dart' as _i10;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i25;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i30;
import '../network/api_client.dart' as _i7;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i35;

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
    gh.lazySingleton<_i9.SearchDataSource>(
        () => _i9.SearchDataSource(apiClient: gh<_i3.APIClient>()));
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
    gh.lazySingleton<_i18.SearchRepository>(() => _i19.SearchRepositoryImpl(
        searchDataSource: gh<_i20.SearchDataSource>()));
    gh.lazySingleton<_i21.AuthRepository>(() =>
        _i22.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i23.AuthUseCase>(
        () => _i23.AuthUseCase(authRepository: gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i24.ProfileUseCase>(() =>
        _i24.ProfileUseCase(profileRepository: gh<_i15.ProfileRepository>()));
    gh.lazySingleton<_i25.WizardUseCase>(() =>
        _i25.WizardUseCase(wizardRepository: gh<_i10.WizardRepository>()));
    gh.lazySingleton<_i26.NetworkUseCase>(() =>
        _i26.NetworkUseCase(networkRepository: gh<_i12.NetworkRepository>()));
    gh.lazySingleton<_i27.AuthBloc>(
        () => _i27.AuthBloc(authUseCase: gh<_i21.AuthUseCase>()));
    gh.lazySingleton<_i28.SearchUseCase>(() =>
        _i28.SearchUseCase(searchRepository: gh<_i29.SearchRepository>()));
    gh.factory<_i30.WizardBloc>(
        () => _i30.WizardBloc(wizardUseCase: gh<_i25.WizardUseCase>()));
    gh.factory<_i31.ProfileBloc>(() => _i31.ProfileBloc(
          authBloc: gh<_i32.AuthBloc>(),
          profileUseCase: gh<_i24.ProfileUseCase>(),
        ));
    gh.factory<_i33.NetworkBloc>(
        () => _i33.NetworkBloc(networkUseCase: gh<_i12.NetworkUseCase>()));
    gh.factory<_i34.SearchBloc>(
        () => _i34.SearchBloc(searchUseCase: gh<_i29.SearchUseCase>()));
    return this;
  }
}

class _$APIClientModule extends _i35.APIClientModule {}
