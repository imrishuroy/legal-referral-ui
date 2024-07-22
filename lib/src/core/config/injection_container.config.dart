// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/advertisement/data/data.dart' as _i26;
import '../../features/advertisement/data/datasources/ad_datasource.dart'
    as _i13;
import '../../features/advertisement/data/repositories/ad_repository.dart'
    as _i25;
import '../../features/advertisement/domain/domain.dart' as _i24;
import '../../features/advertisement/domain/usecases/ad_usecase.dart' as _i36;
import '../../features/advertisement/presentation/bloc/ad_bloc.dart' as _i40;
import '../../features/auth/data/data.dart' as _i4;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i51;
import '../../features/auth/domain/domain.dart' as _i50;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i53;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i57;
import '../../features/auth/presentation/presentation.dart' as _i62;
import '../../features/chat/data/data.dart' as _i39;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i9;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i38;
import '../../features/chat/domain/domain.dart' as _i37;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i52;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i61;
import '../../features/discussion/data/data.dart' as _i18;
import '../../features/discussion/data/datasources/discussion_datasource.dart'
    as _i14;
import '../../features/discussion/data/repository/discussion_repository_impl.dart'
    as _i17;
import '../../features/discussion/domain/domain.dart' as _i16;
import '../../features/discussion/domain/usecases/discussion_usecase.dart'
    as _i48;
import '../../features/discussion/presentation/bloc/discussion_bloc.dart'
    as _i68;
import '../../features/feed/data/data.dart' as _i29;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i12;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i28;
import '../../features/feed/domain/domain.dart' as _i27;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i49;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i66;
import '../../features/network/data/data.dart' as _i23;
import '../../features/network/data/datasource/network_datasource.dart' as _i10;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i22;
import '../../features/network/domain/domain.dart' as _i21;
import '../../features/network/domain/usecases/network_usecase.dart' as _i56;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i67;
import '../../features/post/data/data.dart' as _i35;
import '../../features/post/data/datasources/post_datasource.dart' as _i7;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i34;
import '../../features/post/domain/domain.dart' as _i33;
import '../../features/post/domain/usecases/post_usecase.dart' as _i47;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i63;
import '../../features/profile/data/data.dart' as _i43;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i11;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i42;
import '../../features/profile/domain/domain.dart' as _i41;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i54;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i65;
import '../../features/referral/data/data.dart' as _i32;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i6;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i31;
import '../../features/referral/domain/domain.dart' as _i30;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i60;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i70;
import '../../features/search/data/data.dart' as _i46;
import '../../features/search/data/datasources/search_datasource.dart' as _i15;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i45;
import '../../features/search/domain/domain.dart' as _i59;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i44;
import '../../features/search/domain/usecases/search_usecase.dart' as _i58;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i69;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i20;
import '../../features/wizard/domain/domain.dart' as _i19;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i55;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i64;
import '../network/api_client.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i71;

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
    gh.singleton<_i13.AdDatasource>(
        () => _i13.AdDatasource(apiClient: gh<_i3.APIClient>()));
    gh.singleton<_i14.DiscussionDatasource>(
        () => _i14.DiscussionDatasource(apiClient: gh<_i8.APIClient>()));
    gh.lazySingleton<_i15.SearchDataSource>(
        () => _i15.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.lazySingleton<_i16.DiscussionRepository>(() =>
        _i17.DiscussionRepositoryImpl(
            discussionDatasource: gh<_i18.DiscussionDatasource>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i19.WizardRepository>(() => _i20.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i21.NetworkRepository>(() => _i22.NetworkRepositoryImpl(
        networkDataSource: gh<_i23.NetworkDataSource>()));
    gh.lazySingleton<_i24.AdRepository>(
        () => _i25.AdRepositoryImpl(adDatasource: gh<_i26.AdDatasource>()));
    gh.lazySingleton<_i27.FeedRepository>(() =>
        _i28.FeedRepositoryImpl(feedDatasource: gh<_i29.FeedDatasource>()));
    gh.lazySingleton<_i30.ReferralRepository>(() => _i31.ReferralRepositoryImpl(
        referralDataSource: gh<_i32.ReferralDataSource>()));
    gh.lazySingleton<_i33.PostRepository>(() =>
        _i34.PostRepositoryImpl(postDatasource: gh<_i35.PostDatasource>()));
    gh.lazySingleton<_i36.AdUsecase>(
        () => _i36.AdUsecase(adRepository: gh<_i24.AdRepository>()));
    gh.lazySingleton<_i37.ChatRepository>(() =>
        _i38.ChatRepositoryImpl(chatDataSource: gh<_i39.ChatDataSource>()));
    gh.factory<_i40.AdBloc>(() => _i40.AdBloc(adUsecase: gh<_i24.AdUsecase>()));
    gh.lazySingleton<_i41.ProfileRepository>(() => _i42.ProfileRepositoryImpl(
        profileDataSource: gh<_i43.ProfileDataSource>()));
    gh.lazySingleton<_i44.SearchRepository>(() => _i45.SearchRepositoryImpl(
        searchDataSource: gh<_i46.SearchDataSource>()));
    gh.lazySingleton<_i47.PostUsecase>(
        () => _i47.PostUsecase(postRepository: gh<_i33.PostRepository>()));
    gh.lazySingleton<_i48.DiscussionUsecase>(() => _i48.DiscussionUsecase(
        discussionRepository: gh<_i16.DiscussionRepository>()));
    gh.lazySingleton<_i49.FeedUsecase>(
        () => _i49.FeedUsecase(feedRepository: gh<_i27.FeedRepository>()));
    gh.lazySingleton<_i50.AuthRepository>(() =>
        _i51.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i52.ChatUseCase>(
        () => _i52.ChatUseCase(chatRepository: gh<_i37.ChatRepository>()));
    gh.lazySingleton<_i53.AuthUseCase>(
        () => _i53.AuthUseCase(authRepository: gh<_i50.AuthRepository>()));
    gh.lazySingleton<_i54.ProfileUseCase>(() =>
        _i54.ProfileUseCase(profileRepository: gh<_i41.ProfileRepository>()));
    gh.lazySingleton<_i55.WizardUseCase>(() =>
        _i55.WizardUseCase(wizardRepository: gh<_i19.WizardRepository>()));
    gh.lazySingleton<_i56.NetworkUseCase>(() =>
        _i56.NetworkUseCase(networkRepository: gh<_i21.NetworkRepository>()));
    gh.lazySingleton<_i57.AuthBloc>(
        () => _i57.AuthBloc(authUseCase: gh<_i50.AuthUseCase>()));
    gh.lazySingleton<_i58.SearchUseCase>(() =>
        _i58.SearchUseCase(searchRepository: gh<_i59.SearchRepository>()));
    gh.lazySingleton<_i60.ReferralUseCases>(() => _i60.ReferralUseCases(
        referralRepository: gh<_i30.ReferralRepository>()));
    gh.factory<_i61.ChatBloc>(() => _i61.ChatBloc(
          authBloc: gh<_i62.AuthBloc>(),
          networkUseCase: gh<_i21.NetworkUseCase>(),
          chatUseCase: gh<_i37.ChatUseCase>(),
        ));
    gh.factory<_i63.PostBloc>(
        () => _i63.PostBloc(postUsecase: gh<_i33.PostUsecase>()));
    gh.factory<_i64.WizardBloc>(
        () => _i64.WizardBloc(wizardUseCase: gh<_i55.WizardUseCase>()));
    gh.factory<_i65.ProfileBloc>(() => _i65.ProfileBloc(
          authBloc: gh<_i62.AuthBloc>(),
          profileUseCase: gh<_i54.ProfileUseCase>(),
        ));
    gh.singleton<_i66.FeedBloc>(() => _i66.FeedBloc(
          feedUsecase: gh<_i27.FeedUsecase>(),
          postUsecase: gh<_i33.PostUsecase>(),
          authBloc: gh<_i62.AuthBloc>(),
        ));
    gh.factory<_i67.NetworkBloc>(
        () => _i67.NetworkBloc(networkUseCase: gh<_i21.NetworkUseCase>()));
    gh.factory<_i68.DiscussionBloc>(() => _i68.DiscussionBloc(
          authBloc: gh<_i62.AuthBloc>(),
          discussionUsecase: gh<_i16.DiscussionUsecase>(),
        ));
    gh.factory<_i69.SearchBloc>(
        () => _i69.SearchBloc(searchUseCase: gh<_i59.SearchUseCase>()));
    gh.factory<_i70.ReferralBloc>(
        () => _i70.ReferralBloc(referralUseCases: gh<_i30.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i71.APIClientModule {}
