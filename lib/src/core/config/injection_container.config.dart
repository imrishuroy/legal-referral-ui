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
    as _i46;
import '../../features/auth/domain/domain.dart' as _i45;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i48;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i52;
import '../../features/auth/presentation/presentation.dart' as _i57;
import '../../features/chat/data/data.dart' as _i35;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i10;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i34;
import '../../features/chat/domain/domain.dart' as _i33;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i47;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i56;
import '../../features/discussion/data/data.dart' as _i18;
import '../../features/discussion/data/datasources/discussion_datasource.dart'
    as _i14;
import '../../features/discussion/data/repository/discussion_repository_impl.dart'
    as _i17;
import '../../features/discussion/domain/domain.dart' as _i16;
import '../../features/discussion/domain/usecases/discussion_usecase.dart'
    as _i43;
import '../../features/discussion/presentation/bloc/discussion_bloc.dart'
    as _i63;
import '../../features/feed/data/data.dart' as _i26;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i13;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i25;
import '../../features/feed/domain/domain.dart' as _i24;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i44;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i61;
import '../../features/network/data/data.dart' as _i23;
import '../../features/network/data/datasource/network_datasource.dart' as _i11;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i22;
import '../../features/network/domain/domain.dart' as _i21;
import '../../features/network/domain/usecases/network_usecase.dart' as _i51;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i62;
import '../../features/post/data/data.dart' as _i32;
import '../../features/post/data/datasources/post_datasource.dart' as _i8;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i31;
import '../../features/post/domain/domain.dart' as _i30;
import '../../features/post/domain/usecases/post_usecase.dart' as _i42;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i58;
import '../../features/profile/data/data.dart' as _i38;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i12;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i37;
import '../../features/profile/domain/domain.dart' as _i36;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i49;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i60;
import '../../features/referral/data/data.dart' as _i29;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i7;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i28;
import '../../features/referral/domain/domain.dart' as _i27;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i55;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i65;
import '../../features/search/data/data.dart' as _i41;
import '../../features/search/data/datasources/search_datasource.dart' as _i15;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i40;
import '../../features/search/domain/domain.dart' as _i54;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i39;
import '../../features/search/domain/usecases/search_usecase.dart' as _i53;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i64;
import '../../features/wizard/data/data.dart' as _i6;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i20;
import '../../features/wizard/domain/domain.dart' as _i19;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i50;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i59;
import '../network/api_client.dart' as _i9;
import '../network/network.dart' as _i4;
import 'api_client_module.dart' as _i66;

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
    gh.singleton<_i14.DiscussionDatasource>(
        () => _i14.DiscussionDatasource(apiClient: gh<_i9.APIClient>()));
    gh.lazySingleton<_i15.SearchDataSource>(
        () => _i15.SearchDataSource(apiClient: gh<_i4.APIClient>()));
    gh.lazySingleton<_i16.DiscussionRepository>(() =>
        _i17.DiscussionRepositoryImpl(
            discussionDatasource: gh<_i18.DiscussionDatasource>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i19.WizardRepository>(() => _i20.WizardRepositoryImpl(
        wizardDataSource: gh<_i6.WizardDataSource>()));
    gh.lazySingleton<_i21.NetworkRepository>(() => _i22.NetworkRepositoryImpl(
        networkDataSource: gh<_i23.NetworkDataSource>()));
    gh.lazySingleton<_i24.FeedRepository>(() =>
        _i25.FeedRepositoryImpl(feedDatasource: gh<_i26.FeedDatasource>()));
    gh.lazySingleton<_i27.ReferralRepository>(() => _i28.ReferralRepositoryImpl(
        referralDataSource: gh<_i29.ReferralDataSource>()));
    gh.lazySingleton<_i30.PostRepository>(() =>
        _i31.PostRepositoryImpl(postDatasource: gh<_i32.PostDatasource>()));
    gh.lazySingleton<_i33.ChatRepository>(() =>
        _i34.ChatRepositoryImpl(chatDataSource: gh<_i35.ChatDataSource>()));
    gh.lazySingleton<_i36.ProfileRepository>(() => _i37.ProfileRepositoryImpl(
        profileDataSource: gh<_i38.ProfileDataSource>()));
    gh.lazySingleton<_i39.SearchRepository>(() => _i40.SearchRepositoryImpl(
        searchDataSource: gh<_i41.SearchDataSource>()));
    gh.lazySingleton<_i42.PostUsecase>(
        () => _i42.PostUsecase(postRepository: gh<_i30.PostRepository>()));
    gh.lazySingleton<_i43.DiscussionUsecase>(() => _i43.DiscussionUsecase(
        discussionRepository: gh<_i16.DiscussionRepository>()));
    gh.lazySingleton<_i44.FeedUsecase>(
        () => _i44.FeedUsecase(feedRepository: gh<_i24.FeedRepository>()));
    gh.lazySingleton<_i45.AuthRepository>(() =>
        _i46.AuthRepositoryImpl(authDataSource: gh<_i5.AuthDataSource>()));
    gh.lazySingleton<_i47.ChatUseCase>(
        () => _i47.ChatUseCase(chatRepository: gh<_i33.ChatRepository>()));
    gh.lazySingleton<_i48.AuthUseCase>(
        () => _i48.AuthUseCase(authRepository: gh<_i45.AuthRepository>()));
    gh.lazySingleton<_i49.ProfileUseCase>(() =>
        _i49.ProfileUseCase(profileRepository: gh<_i36.ProfileRepository>()));
    gh.lazySingleton<_i50.WizardUseCase>(() =>
        _i50.WizardUseCase(wizardRepository: gh<_i19.WizardRepository>()));
    gh.lazySingleton<_i51.NetworkUseCase>(() =>
        _i51.NetworkUseCase(networkRepository: gh<_i21.NetworkRepository>()));
    gh.lazySingleton<_i52.AuthBloc>(
        () => _i52.AuthBloc(authUseCase: gh<_i45.AuthUseCase>()));
    gh.lazySingleton<_i53.SearchUseCase>(() =>
        _i53.SearchUseCase(searchRepository: gh<_i54.SearchRepository>()));
    gh.lazySingleton<_i55.ReferralUseCases>(() => _i55.ReferralUseCases(
        referralRepository: gh<_i27.ReferralRepository>()));
    gh.factory<_i56.ChatBloc>(() => _i56.ChatBloc(
          authBloc: gh<_i57.AuthBloc>(),
          networkUseCase: gh<_i21.NetworkUseCase>(),
          chatUseCase: gh<_i33.ChatUseCase>(),
        ));
    gh.factory<_i58.PostBloc>(
        () => _i58.PostBloc(postUsecase: gh<_i30.PostUsecase>()));
    gh.factory<_i59.WizardBloc>(
        () => _i59.WizardBloc(wizardUseCase: gh<_i50.WizardUseCase>()));
    gh.factory<_i60.ProfileBloc>(() => _i60.ProfileBloc(
          authBloc: gh<_i57.AuthBloc>(),
          profileUseCase: gh<_i49.ProfileUseCase>(),
        ));
    gh.singleton<_i61.FeedBloc>(() => _i61.FeedBloc(
          feedUsecase: gh<_i24.FeedUsecase>(),
          postUsecase: gh<_i30.PostUsecase>(),
          authBloc: gh<_i57.AuthBloc>(),
        ));
    gh.factory<_i62.NetworkBloc>(
        () => _i62.NetworkBloc(networkUseCase: gh<_i21.NetworkUseCase>()));
    gh.factory<_i63.DiscussionBloc>(() => _i63.DiscussionBloc(
          authBloc: gh<_i57.AuthBloc>(),
          discussionUsecase: gh<_i16.DiscussionUsecase>(),
        ));
    gh.factory<_i64.SearchBloc>(
        () => _i64.SearchBloc(searchUseCase: gh<_i54.SearchUseCase>()));
    gh.factory<_i65.ReferralBloc>(
        () => _i65.ReferralBloc(referralUseCases: gh<_i27.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i66.APIClientModule {}
