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
    as _i25;
import '../../features/auth/domain/domain.dart' as _i24;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i27;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i31;
import '../../features/auth/presentation/presentation.dart' as _i35;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i6;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i12;
import '../../features/chat/domain/domain.dart' as _i11;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i26;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i34;
import '../../features/network/data/data.dart' as _i17;
import '../../features/network/data/datasource/network_datasource.dart' as _i7;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i16;
import '../../features/network/domain/domain.dart' as _i15;
import '../../features/network/domain/usecases/network_usecase.dart' as _i30;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i38;
import '../../features/profile/data/data.dart' as _i20;
import '../../features/profile/data/datasources/profile_datasource.dart' as _i9;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i19;
import '../../features/profile/domain/domain.dart' as _i18;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i28;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i37;
import '../../features/search/data/data.dart' as _i23;
import '../../features/search/data/datasources/search_datasource.dart' as _i10;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i22;
import '../../features/search/domain/domain.dart' as _i33;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i21;
import '../../features/search/domain/usecases/search_usecase.dart' as _i32;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i39;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i14;
import '../../features/wizard/domain/domain.dart' as _i13;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i29;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i36;
import '../network/api_client.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i40;

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
    gh.singleton<_i6.ChatDataSource>(
        () => _i6.ChatDataSource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i7.NetworkDataSource>(
        () => _i7.NetworkDataSource(apiClient: gh<_i8.APIClient>()));
    gh.singleton<_i9.ProfileDataSource>(
        () => _i9.ProfileDataSource(apiClient: gh<_i3.APIClient>()));
    gh.lazySingleton<_i10.SearchDataSource>(
        () => _i10.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i11.ChatRepository>(() =>
        _i12.ChatRepositoryImpl(chatDataSource: gh<_i6.ChatDataSource>()));
    gh.lazySingleton<_i13.WizardRepository>(() => _i14.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i15.NetworkRepository>(() => _i16.NetworkRepositoryImpl(
        networkDataSource: gh<_i17.NetworkDataSource>()));
    gh.lazySingleton<_i18.ProfileRepository>(() => _i19.ProfileRepositoryImpl(
        profileDataSource: gh<_i20.ProfileDataSource>()));
    gh.lazySingleton<_i21.SearchRepository>(() => _i22.SearchRepositoryImpl(
        searchDataSource: gh<_i23.SearchDataSource>()));
    gh.lazySingleton<_i24.AuthRepository>(() =>
        _i25.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i26.ChatUseCase>(
        () => _i26.ChatUseCase(chatRepository: gh<_i11.ChatRepository>()));
    gh.lazySingleton<_i27.AuthUseCase>(
        () => _i27.AuthUseCase(authRepository: gh<_i24.AuthRepository>()));
    gh.lazySingleton<_i28.ProfileUseCase>(() =>
        _i28.ProfileUseCase(profileRepository: gh<_i18.ProfileRepository>()));
    gh.lazySingleton<_i29.WizardUseCase>(() =>
        _i29.WizardUseCase(wizardRepository: gh<_i13.WizardRepository>()));
    gh.lazySingleton<_i30.NetworkUseCase>(() =>
        _i30.NetworkUseCase(networkRepository: gh<_i15.NetworkRepository>()));
    gh.lazySingleton<_i31.AuthBloc>(
        () => _i31.AuthBloc(authUseCase: gh<_i24.AuthUseCase>()));
    gh.lazySingleton<_i32.SearchUseCase>(() =>
        _i32.SearchUseCase(searchRepository: gh<_i33.SearchRepository>()));
    gh.factory<_i34.ChatBloc>(() => _i34.ChatBloc(
          authBloc: gh<_i35.AuthBloc>(),
          networkUseCase: gh<_i15.NetworkUseCase>(),
          chatUseCase: gh<_i11.ChatUseCase>(),
        ));
    gh.factory<_i36.WizardBloc>(
        () => _i36.WizardBloc(wizardUseCase: gh<_i29.WizardUseCase>()));
    gh.factory<_i37.ProfileBloc>(() => _i37.ProfileBloc(
          authBloc: gh<_i35.AuthBloc>(),
          profileUseCase: gh<_i28.ProfileUseCase>(),
        ));
    gh.factory<_i38.NetworkBloc>(
        () => _i38.NetworkBloc(networkUseCase: gh<_i15.NetworkUseCase>()));
    gh.factory<_i39.SearchBloc>(
        () => _i39.SearchBloc(searchUseCase: gh<_i33.SearchUseCase>()));
    return this;
  }
}

class _$APIClientModule extends _i40.APIClientModule {}
