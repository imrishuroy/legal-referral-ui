// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/advertisement/presentation/bloc/advertisement_bloc.dart'
    as _i3;
import '../../features/auth/data/data.dart' as _i5;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i41;
import '../../features/auth/domain/domain.dart' as _i40;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i43;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i47;
import '../../features/auth/presentation/presentation.dart' as _i52;
import '../../features/chat/data/data.dart' as _i31;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i10;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i30;
import '../../features/chat/domain/domain.dart' as _i29;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i42;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i51;
import '../../features/feed/data/data.dart' as _i22;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i13;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i21;
import '../../features/feed/domain/domain.dart' as _i20;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i39;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i56;
import '../../features/network/data/data.dart' as _i19;
import '../../features/network/data/datasource/network_datasource.dart' as _i11;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i18;
import '../../features/network/domain/domain.dart' as _i17;
import '../../features/network/domain/usecases/network_usecase.dart' as _i46;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i57;
import '../../features/post/data/data.dart' as _i28;
import '../../features/post/data/datasources/post_datasource.dart' as _i8;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i27;
import '../../features/post/domain/domain.dart' as _i26;
import '../../features/post/domain/usecases/post_usecase.dart' as _i38;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i53;
import '../../features/profile/data/data.dart' as _i34;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i12;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i33;
import '../../features/profile/domain/domain.dart' as _i32;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i44;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i55;
import '../../features/referral/data/data.dart' as _i25;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i7;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i24;
import '../../features/referral/domain/domain.dart' as _i23;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i50;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i59;
import '../../features/search/data/data.dart' as _i37;
import '../../features/search/data/datasources/search_datasource.dart' as _i14;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i36;
import '../../features/search/domain/domain.dart' as _i49;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i35;
import '../../features/search/domain/usecases/search_usecase.dart' as _i48;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i58;
import '../../features/wizard/data/data.dart' as _i6;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i16;
import '../../features/wizard/domain/domain.dart' as _i15;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i45;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i54;
import '../network/api_client.dart' as _i9;
import '../network/network.dart' as _i4;
import 'api_client_module.dart' as _i60;

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
    gh.factory<_i3.AdvertisementBloc>(() => _i3.AdvertisementBloc());
    gh.singleton<_i4.APIClient>(() => aPIClientModule.apiClient());
    gh.singleton<_i5.AuthDataSource>(() => aPIClientModule.authDataSource());
    gh.singleton<_i6.WizardDataSource>(
        () => aPIClientModule.wizardDataSource());
    gh.singleton<_i7.ReferralDataSource>(
        () => _i7.ReferralDataSource(apiClient: gh<_i4.APIClient>()));
    gh.singleton<_i8.PostDatasource>(
        () => _i8.PostDatasource(apiClient: gh<_i9.APIClient>()));
    gh.singleton<_i10.ChatDataSource>(
        () => _i10.ChatDataSource(apiClient: gh<_i4.APIClient>()));
    gh.singleton<_i11.NetworkDataSource>(
        () => _i11.NetworkDataSource(apiClient: gh<_i9.APIClient>()));
    gh.singleton<_i12.ProfileDataSource>(
        () => _i12.ProfileDataSource(apiClient: gh<_i4.APIClient>()));
    gh.singleton<_i13.FeedDatasource>(
        () => _i13.FeedDatasource(apiClient: gh<_i4.APIClient>()));
    gh.lazySingleton<_i14.SearchDataSource>(
        () => _i14.SearchDataSource(apiClient: gh<_i4.APIClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i15.WizardRepository>(() => _i16.WizardRepositoryImpl(
        wizardDataSource: gh<_i6.WizardDataSource>()));
    gh.lazySingleton<_i17.NetworkRepository>(() => _i18.NetworkRepositoryImpl(
        networkDataSource: gh<_i19.NetworkDataSource>()));
    gh.lazySingleton<_i20.FeedRepository>(() =>
        _i21.FeedRepositoryImpl(feedDatasource: gh<_i22.FeedDatasource>()));
    gh.lazySingleton<_i23.ReferralRepository>(() => _i24.ReferralRepositoryImpl(
        referralDataSource: gh<_i25.ReferralDataSource>()));
    gh.lazySingleton<_i26.PostRepository>(() =>
        _i27.PostRepositoryImpl(postDatasource: gh<_i28.PostDatasource>()));
    gh.lazySingleton<_i29.ChatRepository>(() =>
        _i30.ChatRepositoryImpl(chatDataSource: gh<_i31.ChatDataSource>()));
    gh.lazySingleton<_i32.ProfileRepository>(() => _i33.ProfileRepositoryImpl(
        profileDataSource: gh<_i34.ProfileDataSource>()));
    gh.lazySingleton<_i35.SearchRepository>(() => _i36.SearchRepositoryImpl(
        searchDataSource: gh<_i37.SearchDataSource>()));
    gh.lazySingleton<_i38.PostUsecase>(
        () => _i38.PostUsecase(postRepository: gh<_i26.PostRepository>()));
    gh.lazySingleton<_i39.FeedUsecase>(
        () => _i39.FeedUsecase(feedRepository: gh<_i20.FeedRepository>()));
    gh.lazySingleton<_i40.AuthRepository>(() =>
        _i41.AuthRepositoryImpl(authDataSource: gh<_i5.AuthDataSource>()));
    gh.lazySingleton<_i42.ChatUseCase>(
        () => _i42.ChatUseCase(chatRepository: gh<_i29.ChatRepository>()));
    gh.lazySingleton<_i43.AuthUseCase>(
        () => _i43.AuthUseCase(authRepository: gh<_i40.AuthRepository>()));
    gh.lazySingleton<_i44.ProfileUseCase>(() =>
        _i44.ProfileUseCase(profileRepository: gh<_i32.ProfileRepository>()));
    gh.lazySingleton<_i45.WizardUseCase>(() =>
        _i45.WizardUseCase(wizardRepository: gh<_i15.WizardRepository>()));
    gh.lazySingleton<_i46.NetworkUseCase>(() =>
        _i46.NetworkUseCase(networkRepository: gh<_i17.NetworkRepository>()));
    gh.lazySingleton<_i47.AuthBloc>(
        () => _i47.AuthBloc(authUseCase: gh<_i40.AuthUseCase>()));
    gh.lazySingleton<_i48.SearchUseCase>(() =>
        _i48.SearchUseCase(searchRepository: gh<_i49.SearchRepository>()));
    gh.lazySingleton<_i50.ReferralUseCases>(() => _i50.ReferralUseCases(
        referralRepository: gh<_i23.ReferralRepository>()));
    gh.factory<_i51.ChatBloc>(() => _i51.ChatBloc(
          authBloc: gh<_i52.AuthBloc>(),
          networkUseCase: gh<_i17.NetworkUseCase>(),
          chatUseCase: gh<_i29.ChatUseCase>(),
        ));
    gh.factory<_i53.PostBloc>(
        () => _i53.PostBloc(postUsecase: gh<_i26.PostUsecase>()));
    gh.factory<_i54.WizardBloc>(
        () => _i54.WizardBloc(wizardUseCase: gh<_i45.WizardUseCase>()));
    gh.factory<_i55.ProfileBloc>(() => _i55.ProfileBloc(
          authBloc: gh<_i52.AuthBloc>(),
          profileUseCase: gh<_i44.ProfileUseCase>(),
        ));
    gh.singleton<_i56.FeedBloc>(() => _i56.FeedBloc(
          feedUsecase: gh<_i20.FeedUsecase>(),
          postUsecase: gh<_i26.PostUsecase>(),
          authBloc: gh<_i52.AuthBloc>(),
        ));
    gh.factory<_i57.NetworkBloc>(
        () => _i57.NetworkBloc(networkUseCase: gh<_i17.NetworkUseCase>()));
    gh.factory<_i58.SearchBloc>(
        () => _i58.SearchBloc(searchUseCase: gh<_i49.SearchUseCase>()));
    gh.factory<_i59.ReferralBloc>(
        () => _i59.ReferralBloc(referralUseCases: gh<_i23.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i60.APIClientModule {}
