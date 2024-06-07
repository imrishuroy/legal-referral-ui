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
    as _i35;
import '../../features/auth/domain/domain.dart' as _i34;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i37;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i41;
import '../../features/auth/presentation/presentation.dart' as _i46;
import '../../features/chat/data/data.dart' as _i26;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i7;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i25;
import '../../features/chat/domain/domain.dart' as _i24;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i36;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i45;
import '../../features/network/data/data.dart' as _i17;
import '../../features/network/data/datasource/network_datasource.dart' as _i8;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i16;
import '../../features/network/domain/domain.dart' as _i15;
import '../../features/network/domain/usecases/network_usecase.dart' as _i40;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i49;
import '../../features/post/data/data.dart' as _i23;
import '../../features/post/data/datasources/post_datasource.dart' as _i11;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i22;
import '../../features/post/domain/domain.dart' as _i21;
import '../../features/post/domain/usecases/post_usecase.dart' as _i33;
import '../../features/profile/data/data.dart' as _i29;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i10;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i28;
import '../../features/profile/domain/domain.dart' as _i27;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i38;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i48;
import '../../features/referral/data/data.dart' as _i20;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i6;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i19;
import '../../features/referral/domain/domain.dart' as _i18;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i44;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i51;
import '../../features/search/data/data.dart' as _i32;
import '../../features/search/data/datasources/search_datasource.dart' as _i12;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i31;
import '../../features/search/domain/domain.dart' as _i43;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i30;
import '../../features/search/domain/usecases/search_usecase.dart' as _i42;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i50;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i14;
import '../../features/wizard/domain/domain.dart' as _i13;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i39;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i47;
import '../network/api_client.dart' as _i9;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i52;

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
    gh.singleton<_i6.ReferralDataSource>(
        () => _i6.ReferralDataSource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i7.ChatDataSource>(
        () => _i7.ChatDataSource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i8.NetworkDataSource>(
        () => _i8.NetworkDataSource(apiClient: gh<_i9.APIClient>()));
    gh.singleton<_i10.ProfileDataSource>(
        () => _i10.ProfileDataSource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i11.PostDatasource>(
        () => _i11.PostDatasource(apiClient: gh<_i9.APIClient>()));
    gh.lazySingleton<_i12.SearchDataSource>(
        () => _i12.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i13.WizardRepository>(() => _i14.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i15.NetworkRepository>(() => _i16.NetworkRepositoryImpl(
        networkDataSource: gh<_i17.NetworkDataSource>()));
    gh.lazySingleton<_i18.ReferralRepository>(() => _i19.ReferralRepositoryImpl(
        referralDataSource: gh<_i20.ReferralDataSource>()));
    gh.lazySingleton<_i21.PostRepository>(() =>
        _i22.PostRepositoryImpl(postDatasource: gh<_i23.PostDatasource>()));
    gh.lazySingleton<_i24.ChatRepository>(() =>
        _i25.ChatRepositoryImpl(chatDataSource: gh<_i26.ChatDataSource>()));
    gh.lazySingleton<_i27.ProfileRepository>(() => _i28.ProfileRepositoryImpl(
        profileDataSource: gh<_i29.ProfileDataSource>()));
    gh.lazySingleton<_i30.SearchRepository>(() => _i31.SearchRepositoryImpl(
        searchDataSource: gh<_i32.SearchDataSource>()));
    gh.lazySingleton<_i33.PostUsecase>(
        () => _i33.PostUsecase(postRepository: gh<_i21.PostRepository>()));
    gh.lazySingleton<_i34.AuthRepository>(() =>
        _i35.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i36.ChatUseCase>(
        () => _i36.ChatUseCase(chatRepository: gh<_i24.ChatRepository>()));
    gh.lazySingleton<_i37.AuthUseCase>(
        () => _i37.AuthUseCase(authRepository: gh<_i34.AuthRepository>()));
    gh.lazySingleton<_i38.ProfileUseCase>(() =>
        _i38.ProfileUseCase(profileRepository: gh<_i27.ProfileRepository>()));
    gh.lazySingleton<_i39.WizardUseCase>(() =>
        _i39.WizardUseCase(wizardRepository: gh<_i13.WizardRepository>()));
    gh.lazySingleton<_i40.NetworkUseCase>(() =>
        _i40.NetworkUseCase(networkRepository: gh<_i15.NetworkRepository>()));
    gh.lazySingleton<_i41.AuthBloc>(
        () => _i41.AuthBloc(authUseCase: gh<_i34.AuthUseCase>()));
    gh.lazySingleton<_i42.SearchUseCase>(() =>
        _i42.SearchUseCase(searchRepository: gh<_i43.SearchRepository>()));
    gh.lazySingleton<_i44.ReferralUseCases>(() => _i44.ReferralUseCases(
        referralRepository: gh<_i18.ReferralRepository>()));
    gh.factory<_i45.ChatBloc>(() => _i45.ChatBloc(
          authBloc: gh<_i46.AuthBloc>(),
          networkUseCase: gh<_i15.NetworkUseCase>(),
          chatUseCase: gh<_i24.ChatUseCase>(),
        ));
    gh.factory<_i47.WizardBloc>(
        () => _i47.WizardBloc(wizardUseCase: gh<_i39.WizardUseCase>()));
    gh.factory<_i48.ProfileBloc>(() => _i48.ProfileBloc(
          authBloc: gh<_i46.AuthBloc>(),
          profileUseCase: gh<_i38.ProfileUseCase>(),
        ));
    gh.factory<_i49.NetworkBloc>(
        () => _i49.NetworkBloc(networkUseCase: gh<_i15.NetworkUseCase>()));
    gh.factory<_i50.SearchBloc>(
        () => _i50.SearchBloc(searchUseCase: gh<_i43.SearchUseCase>()));
    gh.factory<_i51.ReferralBloc>(
        () => _i51.ReferralBloc(referralUseCases: gh<_i18.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i52.APIClientModule {}
