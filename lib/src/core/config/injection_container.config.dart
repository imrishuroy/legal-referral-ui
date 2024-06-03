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
    as _i30;
import '../../features/auth/domain/domain.dart' as _i29;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i32;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i36;
import '../../features/auth/presentation/presentation.dart' as _i41;
import '../../features/chat/data/data.dart' as _i22;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i7;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i21;
import '../../features/chat/domain/domain.dart' as _i20;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i31;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i40;
import '../../features/network/data/data.dart' as _i16;
import '../../features/network/data/datasource/network_datasource.dart' as _i8;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i15;
import '../../features/network/domain/domain.dart' as _i14;
import '../../features/network/domain/usecases/network_usecase.dart' as _i35;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i44;
import '../../features/profile/data/data.dart' as _i25;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i10;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i24;
import '../../features/profile/domain/domain.dart' as _i23;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i33;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i43;
import '../../features/referral/data/data.dart' as _i19;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i6;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i18;
import '../../features/referral/domain/domain.dart' as _i17;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i39;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i46;
import '../../features/search/data/data.dart' as _i28;
import '../../features/search/data/datasources/search_datasource.dart' as _i11;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i27;
import '../../features/search/domain/domain.dart' as _i38;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i26;
import '../../features/search/domain/usecases/search_usecase.dart' as _i37;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i45;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i13;
import '../../features/wizard/domain/domain.dart' as _i12;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i34;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i42;
import '../network/api_client.dart' as _i9;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i47;

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
    gh.lazySingleton<_i11.SearchDataSource>(
        () => _i11.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i12.WizardRepository>(() => _i13.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i14.NetworkRepository>(() => _i15.NetworkRepositoryImpl(
        networkDataSource: gh<_i16.NetworkDataSource>()));
    gh.lazySingleton<_i17.ReferralRepository>(() => _i18.ReferralRepositoryImpl(
        referralDataSource: gh<_i19.ReferralDataSource>()));
    gh.lazySingleton<_i20.ChatRepository>(() =>
        _i21.ChatRepositoryImpl(chatDataSource: gh<_i22.ChatDataSource>()));
    gh.lazySingleton<_i23.ProfileRepository>(() => _i24.ProfileRepositoryImpl(
        profileDataSource: gh<_i25.ProfileDataSource>()));
    gh.lazySingleton<_i26.SearchRepository>(() => _i27.SearchRepositoryImpl(
        searchDataSource: gh<_i28.SearchDataSource>()));
    gh.lazySingleton<_i29.AuthRepository>(() =>
        _i30.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i31.ChatUseCase>(
        () => _i31.ChatUseCase(chatRepository: gh<_i20.ChatRepository>()));
    gh.lazySingleton<_i32.AuthUseCase>(
        () => _i32.AuthUseCase(authRepository: gh<_i29.AuthRepository>()));
    gh.lazySingleton<_i33.ProfileUseCase>(() =>
        _i33.ProfileUseCase(profileRepository: gh<_i23.ProfileRepository>()));
    gh.lazySingleton<_i34.WizardUseCase>(() =>
        _i34.WizardUseCase(wizardRepository: gh<_i12.WizardRepository>()));
    gh.lazySingleton<_i35.NetworkUseCase>(() =>
        _i35.NetworkUseCase(networkRepository: gh<_i14.NetworkRepository>()));
    gh.lazySingleton<_i36.AuthBloc>(
        () => _i36.AuthBloc(authUseCase: gh<_i29.AuthUseCase>()));
    gh.lazySingleton<_i37.SearchUseCase>(() =>
        _i37.SearchUseCase(searchRepository: gh<_i38.SearchRepository>()));
    gh.lazySingleton<_i39.ReferralUseCases>(() => _i39.ReferralUseCases(
        referralRepository: gh<_i17.ReferralRepository>()));
    gh.factory<_i40.ChatBloc>(() => _i40.ChatBloc(
          authBloc: gh<_i41.AuthBloc>(),
          networkUseCase: gh<_i14.NetworkUseCase>(),
          chatUseCase: gh<_i20.ChatUseCase>(),
        ));
    gh.factory<_i42.WizardBloc>(
        () => _i42.WizardBloc(wizardUseCase: gh<_i34.WizardUseCase>()));
    gh.factory<_i43.ProfileBloc>(() => _i43.ProfileBloc(
          authBloc: gh<_i41.AuthBloc>(),
          profileUseCase: gh<_i33.ProfileUseCase>(),
        ));
    gh.factory<_i44.NetworkBloc>(
        () => _i44.NetworkBloc(networkUseCase: gh<_i14.NetworkUseCase>()));
    gh.factory<_i45.SearchBloc>(
        () => _i45.SearchBloc(searchUseCase: gh<_i38.SearchUseCase>()));
    gh.factory<_i46.ReferralBloc>(
        () => _i46.ReferralBloc(referralUseCases: gh<_i17.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i47.APIClientModule {}
