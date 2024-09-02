// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/advertisement/data/data.dart' as _i27;
import '../../features/advertisement/data/datasources/ad_datasource.dart'
    as _i13;
import '../../features/advertisement/data/repositories/ad_repository.dart'
    as _i26;
import '../../features/advertisement/domain/domain.dart' as _i25;
import '../../features/advertisement/domain/usecases/ad_usecase.dart' as _i37;
import '../../features/advertisement/presentation/bloc/ad_bloc.dart' as _i41;
import '../../features/auth/data/data.dart' as _i4;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i52;
import '../../features/auth/domain/domain.dart' as _i51;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i54;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i61;
import '../../features/auth/presentation/presentation.dart' as _i66;
import '../../features/chat/data/data.dart' as _i40;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i9;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i39;
import '../../features/chat/domain/domain.dart' as _i38;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i53;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i65;
import '../../features/discussion/data/data.dart' as _i19;
import '../../features/discussion/data/datasources/discussion_datasource.dart'
    as _i14;
import '../../features/discussion/data/repository/discussion_repository_impl.dart'
    as _i18;
import '../../features/discussion/domain/domain.dart' as _i17;
import '../../features/discussion/domain/usecases/discussion_usecase.dart'
    as _i49;
import '../../features/discussion/presentation/bloc/discussion_bloc.dart'
    as _i73;
import '../../features/feed/data/data.dart' as _i30;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i12;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i29;
import '../../features/feed/domain/domain.dart' as _i28;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i50;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i71;
import '../../features/firm/data/data.dart' as _i57;
import '../../features/firm/data/datasources/firm_datasource.dart' as _i15;
import '../../features/firm/data/repositories/firm_repository_impl.dart'
    as _i56;
import '../../features/firm/domain/domain.dart' as _i55;
import '../../features/firm/domain/usecases/firm_usecase.dart' as _i69;
import '../../features/firm/presentation/bloc/firm_bloc.dart' as _i74;
import '../../features/network/data/data.dart' as _i24;
import '../../features/network/data/datasource/network_datasource.dart' as _i10;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i23;
import '../../features/network/domain/domain.dart' as _i22;
import '../../features/network/domain/usecases/network_usecase.dart' as _i60;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i72;
import '../../features/post/data/data.dart' as _i36;
import '../../features/post/data/datasources/post_datasource.dart' as _i7;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i35;
import '../../features/post/domain/domain.dart' as _i34;
import '../../features/post/domain/usecases/post_usecase.dart' as _i48;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i68;
import '../../features/profile/data/data.dart' as _i44;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i11;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i43;
import '../../features/profile/domain/domain.dart' as _i42;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i58;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i67;
import '../../features/referral/data/data.dart' as _i33;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i6;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i32;
import '../../features/referral/domain/domain.dart' as _i31;
import '../../features/referral/domain/usecases/referral_usecases.dart' as _i64;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i76;
import '../../features/search/data/data.dart' as _i47;
import '../../features/search/data/datasources/search_datasource.dart' as _i16;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i46;
import '../../features/search/domain/domain.dart' as _i63;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i45;
import '../../features/search/domain/usecases/search_usecase.dart' as _i62;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i75;
import '../../features/wizard/data/data.dart' as _i5;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i21;
import '../../features/wizard/domain/domain.dart' as _i20;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i59;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i70;
import '../network/api_client.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i77;

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
    gh.singleton<_i15.FirmDataSource>(
        () => _i15.FirmDataSource(apiClient: gh<_i3.APIClient>()));
    gh.lazySingleton<_i16.SearchDataSource>(
        () => _i16.SearchDataSource(apiClient: gh<_i3.APIClient>()));
    gh.lazySingleton<_i17.DiscussionRepository>(() =>
        _i18.DiscussionRepositoryImpl(
            discussionDatasource: gh<_i19.DiscussionDatasource>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i20.WizardRepository>(() => _i21.WizardRepositoryImpl(
        wizardDataSource: gh<_i5.WizardDataSource>()));
    gh.lazySingleton<_i22.NetworkRepository>(() => _i23.NetworkRepositoryImpl(
        networkDataSource: gh<_i24.NetworkDataSource>()));
    gh.lazySingleton<_i25.AdRepository>(
        () => _i26.AdRepositoryImpl(adDatasource: gh<_i27.AdDatasource>()));
    gh.lazySingleton<_i28.FeedRepository>(() =>
        _i29.FeedRepositoryImpl(feedDatasource: gh<_i30.FeedDatasource>()));
    gh.lazySingleton<_i31.ReferralRepository>(() => _i32.ReferralRepositoryImpl(
        referralDataSource: gh<_i33.ReferralDataSource>()));
    gh.lazySingleton<_i34.PostRepository>(() =>
        _i35.PostRepositoryImpl(postDatasource: gh<_i36.PostDatasource>()));
    gh.lazySingleton<_i37.AdUsecase>(
        () => _i37.AdUsecase(adRepository: gh<_i25.AdRepository>()));
    gh.lazySingleton<_i38.ChatRepository>(() =>
        _i39.ChatRepositoryImpl(chatDataSource: gh<_i40.ChatDataSource>()));
    gh.factory<_i41.AdBloc>(() => _i41.AdBloc(adUsecase: gh<_i25.AdUsecase>()));
    gh.lazySingleton<_i42.ProfileRepository>(() => _i43.ProfileRepositoryImpl(
        profileDataSource: gh<_i44.ProfileDataSource>()));
    gh.lazySingleton<_i45.SearchRepository>(() => _i46.SearchRepositoryImpl(
        searchDataSource: gh<_i47.SearchDataSource>()));
    gh.lazySingleton<_i48.PostUsecase>(
        () => _i48.PostUsecase(postRepository: gh<_i34.PostRepository>()));
    gh.lazySingleton<_i49.DiscussionUsecase>(() => _i49.DiscussionUsecase(
        discussionRepository: gh<_i17.DiscussionRepository>()));
    gh.lazySingleton<_i50.FeedUsecase>(
        () => _i50.FeedUsecase(feedRepository: gh<_i28.FeedRepository>()));
    gh.lazySingleton<_i51.AuthRepository>(() =>
        _i52.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i53.ChatUseCase>(
        () => _i53.ChatUseCase(chatRepository: gh<_i38.ChatRepository>()));
    gh.lazySingleton<_i54.AuthUseCase>(
        () => _i54.AuthUseCase(authRepository: gh<_i51.AuthRepository>()));
    gh.lazySingleton<_i55.FirmRepository>(() =>
        _i56.FirmRepositoryImpl(firmDataSource: gh<_i57.FirmDataSource>()));
    gh.lazySingleton<_i58.ProfileUseCase>(() =>
        _i58.ProfileUseCase(profileRepository: gh<_i42.ProfileRepository>()));
    gh.lazySingleton<_i59.WizardUseCase>(() =>
        _i59.WizardUseCase(wizardRepository: gh<_i20.WizardRepository>()));
    gh.lazySingleton<_i60.NetworkUseCase>(() =>
        _i60.NetworkUseCase(networkRepository: gh<_i22.NetworkRepository>()));
    gh.lazySingleton<_i61.AuthBloc>(
        () => _i61.AuthBloc(authUseCase: gh<_i51.AuthUseCase>()));
    gh.lazySingleton<_i62.SearchUseCase>(() =>
        _i62.SearchUseCase(searchRepository: gh<_i63.SearchRepository>()));
    gh.lazySingleton<_i64.ReferralUseCases>(() => _i64.ReferralUseCases(
        referralRepository: gh<_i31.ReferralRepository>()));
    gh.factory<_i65.ChatBloc>(() => _i65.ChatBloc(
          authBloc: gh<_i66.AuthBloc>(),
          networkUseCase: gh<_i22.NetworkUseCase>(),
          chatUseCase: gh<_i38.ChatUseCase>(),
        ));
    gh.factory<_i67.ProfileBloc>(() => _i67.ProfileBloc(
          authBloc: gh<_i66.AuthBloc>(),
          profileUseCase: gh<_i42.ProfileUseCase>(),
        ));
    gh.factory<_i68.PostBloc>(
        () => _i68.PostBloc(postUsecase: gh<_i34.PostUsecase>()));
    gh.lazySingleton<_i69.FirmUseCase>(
        () => _i69.FirmUseCase(firmRepository: gh<_i55.FirmRepository>()));
    gh.factory<_i70.WizardBloc>(
        () => _i70.WizardBloc(wizardUseCase: gh<_i59.WizardUseCase>()));
    gh.singleton<_i71.FeedBloc>(() => _i71.FeedBloc(
          feedUsecase: gh<_i28.FeedUsecase>(),
          postUsecase: gh<_i34.PostUsecase>(),
          authBloc: gh<_i66.AuthBloc>(),
        ));
    gh.factory<_i72.NetworkBloc>(
        () => _i72.NetworkBloc(networkUseCase: gh<_i22.NetworkUseCase>()));
    gh.factory<_i73.DiscussionBloc>(() => _i73.DiscussionBloc(
          authBloc: gh<_i66.AuthBloc>(),
          discussionUsecase: gh<_i17.DiscussionUsecase>(),
        ));
    gh.factory<_i74.FirmBloc>(() => _i74.FirmBloc(
          firmUsecase: gh<_i55.FirmUseCase>(),
          profileUseCase: gh<_i42.ProfileUseCase>(),
        ));
    gh.factory<_i75.SearchBloc>(
        () => _i75.SearchBloc(searchUseCase: gh<_i63.SearchUseCase>()));
    gh.factory<_i76.ReferralBloc>(
        () => _i76.ReferralBloc(referralUseCases: gh<_i31.ReferralUseCases>()));
    return this;
  }
}

class _$APIClientModule extends _i77.APIClientModule {}
