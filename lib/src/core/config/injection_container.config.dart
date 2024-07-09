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
    as _i45;
import '../../features/auth/domain/domain.dart' as _i44;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i47;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i51;
import '../../features/auth/presentation/presentation.dart' as _i56;
import '../../features/chat/data/data.dart' as _i34;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i9;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i33;
import '../../features/chat/domain/domain.dart' as _i32;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i46;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i55;
import '../../features/discussion/data/data.dart' as _i17;
import '../../features/discussion/data/datasources/discussion_datasource.dart'
    as _i13;
import '../../features/discussion/data/repository/discussion_repository_impl.dart'
    as _i16;
import '../../features/discussion/domain/domain.dart' as _i15;
import '../../features/discussion/domain/usecases/discussion_usecase.dart'
    as _i42;
import '../../features/discussion/presentation/bloc/discussion_bloc.dart'
    as _i62;
import '../../features/feed/data/data.dart' as _i25;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i12;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i24;
import '../../features/feed/domain/domain.dart' as _i23;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i43;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i60;
import '../../features/network/data/data.dart' as _i22;
import '../../features/network/data/datasource/network_datasource.dart' as _i10;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i21;
import '../../features/network/domain/domain.dart' as _i20;
import '../../features/network/domain/usecases/network_usecase.dart' as _i50;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i61;
import '../../features/post/data/data.dart' as _i31;
import '../../features/post/data/datasources/post_datasource.dart' as _i7;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i30;
import '../../features/post/domain/domain.dart' as _i29;
import '../../features/post/domain/usecases/post_usecase.dart' as _i41;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i57;
import '../../features/profile/data/data.dart' as _i37;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i11;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i36;
import '../../features/profile/domain/domain.dart' as _i35;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i48;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i59;
import '../../features/referral/data/data.dart' as _i28;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i6;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i27;
import '../../features/referral/domain/domain.dart' as _i26;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i54;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i64;
import '../../features/search/data/data.dart' as _i40;
import '../../features/search/data/datasources/search_datasource.dart' as _i14;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i39;
import '../../features/search/domain/domain.dart' as _i53;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i38;
import '../../features/search/domain/usecases/search_usecase.dart' as _i52;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i63;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i19;
import '../../features/wizard/domain/domain.dart' as _i18;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i49;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i58;
import '../network/api_client.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i65;

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
    gh.singleton<_i13.DiscussionDatasource>(
        () => _i13.DiscussionDatasource(apiClient: gh<_i8.APIClient>()));
    gh.lazySingleton<_i14.SearchDataSource>(
        () => _i14.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.lazySingleton<_i15.DiscussionRepository>(() =>
        _i16.DiscussionRepositoryImpl(
            discussionDatasource: gh<_i17.DiscussionDatasource>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i18.WizardRepository>(() => _i19.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i20.NetworkRepository>(() => _i21.NetworkRepositoryImpl(
        networkDataSource: gh<_i22.NetworkDataSource>()));
    gh.lazySingleton<_i23.FeedRepository>(() =>
        _i24.FeedRepositoryImpl(feedDatasource: gh<_i25.FeedDatasource>()));
    gh.lazySingleton<_i26.ReferralRepository>(() => _i27.ReferralRepositoryImpl(
        referralDataSource: gh<_i28.ReferralDataSource>()));
    gh.lazySingleton<_i29.PostRepository>(() =>
        _i30.PostRepositoryImpl(postDatasource: gh<_i31.PostDatasource>()));
    gh.lazySingleton<_i32.ChatRepository>(() =>
        _i33.ChatRepositoryImpl(chatDataSource: gh<_i34.ChatDataSource>()));
    gh.lazySingleton<_i35.ProfileRepository>(() => _i36.ProfileRepositoryImpl(
        profileDataSource: gh<_i37.ProfileDataSource>()));
    gh.lazySingleton<_i38.SearchRepository>(() => _i39.SearchRepositoryImpl(
        searchDataSource: gh<_i40.SearchDataSource>()));
    gh.lazySingleton<_i41.PostUsecase>(
        () => _i41.PostUsecase(postRepository: gh<_i29.PostRepository>()));
    gh.lazySingleton<_i42.DiscussionUsecase>(() => _i42.DiscussionUsecase(
        discussionRepository: gh<_i15.DiscussionRepository>()));
    gh.lazySingleton<_i43.FeedUsecase>(
        () => _i43.FeedUsecase(feedRepository: gh<_i23.FeedRepository>()));
    gh.lazySingleton<_i44.AuthRepository>(() =>
        _i45.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i46.ChatUseCase>(
        () => _i46.ChatUseCase(chatRepository: gh<_i32.ChatRepository>()));
    gh.lazySingleton<_i47.AuthUseCase>(
        () => _i47.AuthUseCase(authRepository: gh<_i44.AuthRepository>()));
    gh.lazySingleton<_i48.ProfileUseCase>(() =>
        _i48.ProfileUseCase(profileRepository: gh<_i35.ProfileRepository>()));
    gh.lazySingleton<_i49.WizardUseCase>(() =>
        _i49.WizardUseCase(wizardRepository: gh<_i18.WizardRepository>()));
    gh.lazySingleton<_i50.NetworkUseCase>(() =>
        _i50.NetworkUseCase(networkRepository: gh<_i20.NetworkRepository>()));
    gh.lazySingleton<_i51.AuthBloc>(
        () => _i51.AuthBloc(authUseCase: gh<_i44.AuthUseCase>()));
    gh.lazySingleton<_i52.SearchUseCase>(() =>
        _i52.SearchUseCase(searchRepository: gh<_i53.SearchRepository>()));
    gh.lazySingleton<_i54.ReferralUseCases>(() => _i54.ReferralUseCases(
        referralRepository: gh<_i26.ReferralRepository>()));
    gh.factory<_i55.ChatBloc>(() => _i55.ChatBloc(
          authBloc: gh<_i56.AuthBloc>(),
          networkUseCase: gh<_i20.NetworkUseCase>(),
          chatUseCase: gh<_i32.ChatUseCase>(),
        ));
    gh.factory<_i57.PostBloc>(
        () => _i57.PostBloc(postUsecase: gh<_i29.PostUsecase>()));
    gh.factory<_i58.WizardBloc>(
        () => _i58.WizardBloc(wizardUseCase: gh<_i49.WizardUseCase>()));
    gh.factory<_i59.ProfileBloc>(() => _i59.ProfileBloc(
          authBloc: gh<_i56.AuthBloc>(),
          profileUseCase: gh<_i48.ProfileUseCase>(),
        ));
    gh.singleton<_i60.FeedBloc>(() => _i60.FeedBloc(
          feedUsecase: gh<_i23.FeedUsecase>(),
          postUsecase: gh<_i29.PostUsecase>(),
          authBloc: gh<_i56.AuthBloc>(),
        ));
    gh.factory<_i61.NetworkBloc>(
        () => _i61.NetworkBloc(networkUseCase: gh<_i20.NetworkUseCase>()));
    gh.factory<_i62.DiscussionBloc>(() => _i62.DiscussionBloc(
          authBloc: gh<_i56.AuthBloc>(),
          discussionUsecase: gh<_i15.DiscussionUsecase>(),
        ));
    gh.factory<_i63.SearchBloc>(
        () => _i63.SearchBloc(searchUseCase: gh<_i53.SearchUseCase>()));
    gh.factory<_i64.ReferralBloc>(
        () => _i64.ReferralBloc(referralUseCases: gh<_i26.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i65.APIClientModule {}
