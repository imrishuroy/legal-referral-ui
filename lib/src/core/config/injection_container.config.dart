// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/data.dart' as _i5;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i31;
import '../../features/auth/domain/domain.dart' as _i30;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i33;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i37;
import '../../features/auth/presentation/presentation.dart' as _i42;
import '../../features/chat/data/data.dart' as _i23;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i8;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i22;
import '../../features/chat/domain/domain.dart' as _i21;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i32;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i41;
import '../../features/network/data/data.dart' as _i17;
import '../../features/network/data/datasource/network_datasource.dart' as _i9;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i16;
import '../../features/network/domain/domain.dart' as _i15;
import '../../features/network/domain/usecases/network_usecase.dart' as _i36;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i45;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i3;
import '../../features/profile/data/data.dart' as _i26;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i11;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i25;
import '../../features/profile/domain/domain.dart' as _i24;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i34;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i44;
import '../../features/referral/data/data.dart' as _i20;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i7;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i19;
import '../../features/referral/domain/domain.dart' as _i18;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i40;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i47;
import '../../features/search/data/data.dart' as _i29;
import '../../features/search/data/datasources/search_datasource.dart' as _i12;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i28;
import '../../features/search/domain/domain.dart' as _i39;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i27;
import '../../features/search/domain/usecases/search_usecase.dart' as _i38;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i46;
import '../../features/wizard/data/data.dart' as _i6;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i14;
import '../../features/wizard/domain/domain.dart' as _i13;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i35;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i43;
import '../network/api_client.dart' as _i10;
import '../network/network.dart' as _i4;
import 'api_client_module.dart' as _i48;

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
    gh.factory<_i3.PostBloc>(() => _i3.PostBloc());
    gh.singleton<_i4.APIClient>(() => aPIClientModule.apiClient());
    gh.singleton<_i5.AuthDataSource>(() => aPIClientModule.authDataSource());
    gh.singleton<_i6.WizardDataSource>(
        () => aPIClientModule.wizardDataSource());
    gh.singleton<_i7.ReferralDataSource>(
        () => _i7.ReferralDataSource(apiClient: gh<_i4.APIClient>()));
    gh.singleton<_i8.ChatDataSource>(
        () => _i8.ChatDataSource(apiClient: gh<_i4.APIClient>()));
    gh.singleton<_i9.NetworkDataSource>(
        () => _i9.NetworkDataSource(apiClient: gh<_i10.APIClient>()));
    gh.singleton<_i11.ProfileDataSource>(
        () => _i11.ProfileDataSource(apiClient: gh<_i4.APIClient>()));
    gh.lazySingleton<_i12.SearchDataSource>(
        () => _i12.SearchDataSource(apiClient: gh<_i4.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i13.WizardRepository>(() => _i14.WizardRepositoryImpl(
        wizardDataSource: gh<_i6.WizardDataSource>()));
    gh.lazySingleton<_i15.NetworkRepository>(() => _i16.NetworkRepositoryImpl(
        networkDataSource: gh<_i17.NetworkDataSource>()));
    gh.lazySingleton<_i18.ReferralRepository>(() => _i19.ReferralRepositoryImpl(
        referralDataSource: gh<_i20.ReferralDataSource>()));
    gh.lazySingleton<_i21.ChatRepository>(() =>
        _i22.ChatRepositoryImpl(chatDataSource: gh<_i23.ChatDataSource>()));
    gh.lazySingleton<_i24.ProfileRepository>(() => _i25.ProfileRepositoryImpl(
        profileDataSource: gh<_i26.ProfileDataSource>()));
    gh.lazySingleton<_i27.SearchRepository>(() => _i28.SearchRepositoryImpl(
        searchDataSource: gh<_i29.SearchDataSource>()));
    gh.lazySingleton<_i30.AuthRepository>(() =>
        _i31.AuthRepositoryImpl(authDataSource: gh<_i5.AuthDataSource>()));
    gh.lazySingleton<_i32.ChatUseCase>(
        () => _i32.ChatUseCase(chatRepository: gh<_i21.ChatRepository>()));
    gh.lazySingleton<_i33.AuthUseCase>(
        () => _i33.AuthUseCase(authRepository: gh<_i30.AuthRepository>()));
    gh.lazySingleton<_i34.ProfileUseCase>(() =>
        _i34.ProfileUseCase(profileRepository: gh<_i24.ProfileRepository>()));
    gh.lazySingleton<_i35.WizardUseCase>(() =>
        _i35.WizardUseCase(wizardRepository: gh<_i13.WizardRepository>()));
    gh.lazySingleton<_i36.NetworkUseCase>(() =>
        _i36.NetworkUseCase(networkRepository: gh<_i15.NetworkRepository>()));
    gh.lazySingleton<_i37.AuthBloc>(
        () => _i37.AuthBloc(authUseCase: gh<_i30.AuthUseCase>()));
    gh.lazySingleton<_i38.SearchUseCase>(() =>
        _i38.SearchUseCase(searchRepository: gh<_i39.SearchRepository>()));
    gh.lazySingleton<_i40.ReferralUseCases>(() => _i40.ReferralUseCases(
        referralRepository: gh<_i18.ReferralRepository>()));
    gh.factory<_i41.ChatBloc>(() => _i41.ChatBloc(
          authBloc: gh<_i42.AuthBloc>(),
          networkUseCase: gh<_i15.NetworkUseCase>(),
          chatUseCase: gh<_i21.ChatUseCase>(),
        ));
    gh.factory<_i43.WizardBloc>(
        () => _i43.WizardBloc(wizardUseCase: gh<_i35.WizardUseCase>()));
    gh.factory<_i44.ProfileBloc>(() => _i44.ProfileBloc(
          authBloc: gh<_i42.AuthBloc>(),
          profileUseCase: gh<_i34.ProfileUseCase>(),
        ));
    gh.factory<_i45.NetworkBloc>(
        () => _i45.NetworkBloc(networkUseCase: gh<_i15.NetworkUseCase>()));
    gh.factory<_i46.SearchBloc>(
        () => _i46.SearchBloc(searchUseCase: gh<_i39.SearchUseCase>()));
    gh.factory<_i47.ReferralBloc>(
        () => _i47.ReferralBloc(referralUseCases: gh<_i18.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i48.APIClientModule {}
