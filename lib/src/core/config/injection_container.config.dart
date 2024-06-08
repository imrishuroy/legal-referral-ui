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
    as _i40;
import '../../features/auth/domain/domain.dart' as _i39;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i42;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i47;
import '../../features/auth/presentation/presentation.dart' as _i52;
import '../../features/chat/data/data.dart' as _i30;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i9;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i29;
import '../../features/chat/domain/domain.dart' as _i28;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i41;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i51;
import '../../features/feed/data/data.dart' as _i21;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i12;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i20;
import '../../features/feed/domain/domain.dart' as _i19;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i38;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i43;
import '../../features/network/data/data.dart' as _i18;
import '../../features/network/data/datasource/network_datasource.dart' as _i10;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i17;
import '../../features/network/domain/domain.dart' as _i16;
import '../../features/network/domain/usecases/network_usecase.dart' as _i46;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i56;
import '../../features/post/data/data.dart' as _i27;
import '../../features/post/data/datasources/post_datasource.dart' as _i7;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i26;
import '../../features/post/domain/domain.dart' as _i25;
import '../../features/post/domain/usecases/post_usecase.dart' as _i37;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i53;
import '../../features/profile/data/data.dart' as _i33;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i11;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i32;
import '../../features/profile/domain/domain.dart' as _i31;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i44;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i55;
import '../../features/referral/data/data.dart' as _i24;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i6;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i23;
import '../../features/referral/domain/domain.dart' as _i22;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i50;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i58;
import '../../features/search/data/data.dart' as _i36;
import '../../features/search/data/datasources/search_datasource.dart' as _i13;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i35;
import '../../features/search/domain/domain.dart' as _i49;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i34;
import '../../features/search/domain/usecases/search_usecase.dart' as _i48;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i57;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i15;
import '../../features/wizard/domain/domain.dart' as _i14;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i45;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i54;
import '../network/api_client.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i59;

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
    gh.singleton<_i7.PostDatasource>(
        () => _i7.PostDatasource(apiClient: gh<_i8.APIClient>()));
    gh.singleton<_i9.ChatDataSource>(
        () => _i9.ChatDataSource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i10.NetworkDataSource>(
        () => _i10.NetworkDataSource(apiClient: gh<_i8.APIClient>()));
    gh.singleton<_i11.ProfileDataSource>(
        () => _i11.ProfileDataSource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i12.FeedDatasource>(
        () => _i12.FeedDatasource(apiClient: gh<_i3.APIClient>()));
    gh.lazySingleton<_i13.SearchDataSource>(
        () => _i13.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i14.WizardRepository>(() => _i15.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i16.NetworkRepository>(() => _i17.NetworkRepositoryImpl(
        networkDataSource: gh<_i18.NetworkDataSource>()));
    gh.lazySingleton<_i19.FeedRepository>(() =>
        _i20.FeedRepositoryImpl(feedDatasource: gh<_i21.FeedDatasource>()));
    gh.lazySingleton<_i22.ReferralRepository>(() => _i23.ReferralRepositoryImpl(
        referralDataSource: gh<_i24.ReferralDataSource>()));
    gh.lazySingleton<_i25.PostRepository>(() =>
        _i26.PostRepositoryImpl(postDatasource: gh<_i27.PostDatasource>()));
    gh.lazySingleton<_i28.ChatRepository>(() =>
        _i29.ChatRepositoryImpl(chatDataSource: gh<_i30.ChatDataSource>()));
    gh.lazySingleton<_i31.ProfileRepository>(() => _i32.ProfileRepositoryImpl(
        profileDataSource: gh<_i33.ProfileDataSource>()));
    gh.lazySingleton<_i34.SearchRepository>(() => _i35.SearchRepositoryImpl(
        searchDataSource: gh<_i36.SearchDataSource>()));
    gh.lazySingleton<_i37.PostUsecase>(
        () => _i37.PostUsecase(postRepository: gh<_i25.PostRepository>()));
    gh.lazySingleton<_i38.FeedUsecase>(
        () => _i38.FeedUsecase(feedRepository: gh<_i19.FeedRepository>()));
    gh.lazySingleton<_i39.AuthRepository>(() =>
        _i40.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i41.ChatUseCase>(
        () => _i41.ChatUseCase(chatRepository: gh<_i28.ChatRepository>()));
    gh.lazySingleton<_i42.AuthUseCase>(
        () => _i42.AuthUseCase(authRepository: gh<_i39.AuthRepository>()));
    gh.singleton<_i43.FeedBloc>(
        () => _i43.FeedBloc(feedUsecase: gh<_i19.FeedUsecase>()));
    gh.lazySingleton<_i44.ProfileUseCase>(() =>
        _i44.ProfileUseCase(profileRepository: gh<_i31.ProfileRepository>()));
    gh.lazySingleton<_i45.WizardUseCase>(() =>
        _i45.WizardUseCase(wizardRepository: gh<_i14.WizardRepository>()));
    gh.lazySingleton<_i46.NetworkUseCase>(() =>
        _i46.NetworkUseCase(networkRepository: gh<_i16.NetworkRepository>()));
    gh.lazySingleton<_i47.AuthBloc>(
        () => _i47.AuthBloc(authUseCase: gh<_i39.AuthUseCase>()));
    gh.lazySingleton<_i48.SearchUseCase>(() =>
        _i48.SearchUseCase(searchRepository: gh<_i49.SearchRepository>()));
    gh.lazySingleton<_i50.ReferralUseCases>(() => _i50.ReferralUseCases(
        referralRepository: gh<_i22.ReferralRepository>()));
    gh.factory<_i51.ChatBloc>(() => _i51.ChatBloc(
          authBloc: gh<_i52.AuthBloc>(),
          networkUseCase: gh<_i16.NetworkUseCase>(),
          chatUseCase: gh<_i28.ChatUseCase>(),
        ));
    gh.factory<_i53.PostBloc>(
        () => _i53.PostBloc(postUsecase: gh<_i37.PostUsecase>()));
    gh.factory<_i54.WizardBloc>(
        () => _i54.WizardBloc(wizardUseCase: gh<_i45.WizardUseCase>()));
    gh.factory<_i55.ProfileBloc>(() => _i55.ProfileBloc(
          authBloc: gh<_i52.AuthBloc>(),
          profileUseCase: gh<_i44.ProfileUseCase>(),
        ));
    gh.factory<_i56.NetworkBloc>(
        () => _i56.NetworkBloc(networkUseCase: gh<_i16.NetworkUseCase>()));
    gh.factory<_i57.SearchBloc>(
        () => _i57.SearchBloc(searchUseCase: gh<_i49.SearchUseCase>()));
    gh.factory<_i58.ReferralBloc>(
        () => _i58.ReferralBloc(referralUseCases: gh<_i22.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i59.APIClientModule {}
