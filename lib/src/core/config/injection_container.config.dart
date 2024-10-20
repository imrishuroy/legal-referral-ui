// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/account/data/data.dart' as _i970;
import '../../features/account/data/datasources/account_datasource.dart'
    as _i1048;
import '../../features/account/data/repositories/account_repository_impl.dart'
    as _i857;
import '../../features/account/domain/domain.dart' as _i808;
import '../../features/account/domain/usecases/account_usecase.dart' as _i772;
import '../../features/account/presentation/bloc/account_bloc.dart' as _i708;
import '../../features/advertisement/data/data.dart' as _i161;
import '../../features/advertisement/data/datasources/ad_datasource.dart'
    as _i78;
import '../../features/advertisement/data/repositories/ad_repository.dart'
    as _i202;
import '../../features/advertisement/domain/domain.dart' as _i520;
import '../../features/advertisement/domain/usecases/ad_usecase.dart' as _i551;
import '../../features/advertisement/presentation/bloc/ad_bloc.dart' as _i132;
import '../../features/auth/data/data.dart' as _i704;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/domain.dart' as _i140;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i436;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/auth/presentation/presentation.dart' as _i481;
import '../../features/chat/data/data.dart' as _i891;
import '../../features/chat/data/datasources/chat_datasource.dart' as _i273;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i504;
import '../../features/chat/domain/domain.dart' as _i1003;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i569;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i65;
import '../../features/discussion/data/data.dart' as _i238;
import '../../features/discussion/data/datasources/discussion_datasource.dart'
    as _i219;
import '../../features/discussion/data/repository/discussion_repository_impl.dart'
    as _i425;
import '../../features/discussion/domain/domain.dart' as _i931;
import '../../features/discussion/domain/usecases/discussion_usecase.dart'
    as _i356;
import '../../features/discussion/presentation/bloc/discussion_bloc.dart'
    as _i355;
import '../../features/feed/data/data.dart' as _i84;
import '../../features/feed/data/datasources/feed_datasource.dart' as _i787;
import '../../features/feed/data/repositories/feed_repository_impl.dart'
    as _i452;
import '../../features/feed/domain/domain.dart' as _i40;
import '../../features/feed/domain/usecases/feed_usecase.dart' as _i995;
import '../../features/feed/presentation/bloc/feed_bloc.dart' as _i774;
import '../../features/firm/data/data.dart' as _i300;
import '../../features/firm/data/datasources/firm_datasource.dart' as _i451;
import '../../features/firm/data/repositories/firm_repository_impl.dart'
    as _i689;
import '../../features/firm/domain/domain.dart' as _i133;
import '../../features/firm/domain/usecases/firm_usecase.dart' as _i167;
import '../../features/firm/presentation/bloc/firm_bloc.dart' as _i370;
import '../../features/network/data/data.dart' as _i384;
import '../../features/network/data/datasource/network_datasource.dart'
    as _i994;
import '../../features/network/data/repositories/network_repository_impl.dart'
    as _i109;
import '../../features/network/domain/domain.dart' as _i318;
import '../../features/network/domain/usecases/network_usecase.dart' as _i573;
import '../../features/network/presentation/bloc/network_bloc.dart' as _i179;
import '../../features/notifications/data/data.dart' as _i566;
import '../../features/notifications/data/datasources/notifications_datasource.dart'
    as _i200;
import '../../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i201;
import '../../features/notifications/domain/domain.dart' as _i661;
import '../../features/notifications/domain/usecases/notifications_usecase.dart'
    as _i40;
import '../../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i1041;
import '../../features/post/data/data.dart' as _i1069;
import '../../features/post/data/datasources/post_datasource.dart' as _i121;
import '../../features/post/data/repositories/post_repository_impl.dart'
    as _i1039;
import '../../features/post/domain/domain.dart' as _i262;
import '../../features/post/domain/usecases/post_usecase.dart' as _i430;
import '../../features/post/presentation/bloc/post_bloc.dart' as _i896;
import '../../features/profile/data/data.dart' as _i49;
import '../../features/profile/data/datasources/profile_datasource.dart'
    as _i553;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/domain.dart' as _i193;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i996;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/referral/data/data.dart' as _i622;
import '../../features/referral/data/datasources/referral_datasource.dart'
    as _i48;
import '../../features/referral/data/repositories/referral_repository_impl.dart'
    as _i750;
import '../../features/referral/domain/domain.dart' as _i386;
import '../../features/referral/domain/usecases/referral_usecases.dart'
    as _i398;
import '../../features/referral/presentation/bloc/referral_bloc.dart' as _i494;
import '../../features/saved_posts/data/data.dart' as _i358;
import '../../features/saved_posts/data/datasources/saved_posts_datasource.dart'
    as _i618;
import '../../features/saved_posts/data/repositories/saved_posts_repository_impl.dart'
    as _i595;
import '../../features/saved_posts/domain/domain.dart' as _i1062;
import '../../features/saved_posts/domain/usecases/saved_posts_usecase.dart'
    as _i492;
import '../../features/saved_posts/presentation/bloc/saved_posts_bloc.dart'
    as _i192;
import '../../features/search/data/data.dart' as _i461;
import '../../features/search/data/datasources/search_datasource.dart' as _i566;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i1017;
import '../../features/search/domain/domain.dart' as _i686;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i357;
import '../../features/search/domain/usecases/search_usecase.dart' as _i1053;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i552;
import '../../features/wizard/data/data.dart' as _i323;
import '../../features/wizard/data/repositories/wizard_repository_impl.dart'
    as _i888;
import '../../features/wizard/domain/domain.dart' as _i57;
import '../../features/wizard/domain/usecases/wizard_usecase.dart' as _i974;
import '../../features/wizard/presentation/bloc/wizard_bloc.dart' as _i991;
import '../network/api_client.dart' as _i557;
import '../network/network.dart' as _i855;
import '../utils/local_notification_util.dart' as _i820;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i855.APIClient>(() => registerModule.apiClient());
    gh.singleton<_i704.AuthDataSource>(() => registerModule.authDataSource());
    gh.singleton<_i323.WizardDataSource>(
        () => registerModule.wizardDataSource());
    gh.lazySingleton<_i820.LocalNotificationUtil>(
        () => _i820.LocalNotificationUtil());
    gh.singleton<_i48.ReferralDataSource>(
        () => _i48.ReferralDataSource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i121.PostDatasource>(
        () => _i121.PostDatasource(apiClient: gh<_i557.APIClient>()));
    gh.singleton<_i273.ChatDataSource>(
        () => _i273.ChatDataSource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i994.NetworkDataSource>(
        () => _i994.NetworkDataSource(apiClient: gh<_i557.APIClient>()));
    gh.singleton<_i451.FirmDataSource>(
        () => _i451.FirmDataSource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i553.ProfileDataSource>(
        () => _i553.ProfileDataSource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i618.SavedPostsDatasource>(
        () => _i618.SavedPostsDatasource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i787.FeedDatasource>(
        () => _i787.FeedDatasource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i78.AdDatasource>(
        () => _i78.AdDatasource(apiClient: gh<_i855.APIClient>()));
    gh.singleton<_i1048.AccountDatasource>(
        () => _i1048.AccountDatasource(apiClient: gh<_i557.APIClient>()));
    gh.singleton<_i219.DiscussionDatasource>(
        () => _i219.DiscussionDatasource(apiClient: gh<_i557.APIClient>()));
    gh.singleton<_i200.NotificationsDatasource>(
        () => _i200.NotificationsDatasource(apiClient: gh<_i557.APIClient>()));
    gh.lazySingleton<_i566.SearchDataSource>(
        () => _i566.SearchDataSource(apiClient: gh<_i855.APIClient>()));
    gh.lazySingleton<_i931.DiscussionRepository>(() =>
        _i425.DiscussionRepositoryImpl(
            discussionDatasource: gh<_i238.DiscussionDatasource>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i57.WizardRepository>(() => _i888.WizardRepositoryImpl(
        wizardDataSource: gh<_i323.WizardDataSource>()));
    gh.lazySingleton<_i318.NetworkRepository>(() => _i109.NetworkRepositoryImpl(
        networkDataSource: gh<_i384.NetworkDataSource>()));
    gh.lazySingleton<_i520.AdRepository>(
        () => _i202.AdRepositoryImpl(adDatasource: gh<_i161.AdDatasource>()));
    gh.lazySingleton<_i40.FeedRepository>(() =>
        _i452.FeedRepositoryImpl(feedDatasource: gh<_i84.FeedDatasource>()));
    gh.lazySingleton<_i808.AccountRepository>(() => _i857.AccountRepositoryImpl(
        accountDatasource: gh<_i970.AccountDatasource>()));
    gh.lazySingleton<_i772.AccountUsecase>(() =>
        _i772.AccountUsecase(accountRepository: gh<_i808.AccountRepository>()));
    gh.lazySingleton<_i661.NotificationsRepository>(() =>
        _i201.NotificationsRepositoryImpl(
            notificationsDatasource: gh<_i566.NotificationsDatasource>()));
    gh.lazySingleton<_i386.ReferralRepository>(() =>
        _i750.ReferralRepositoryImpl(
            referralDataSource: gh<_i622.ReferralDataSource>()));
    gh.lazySingleton<_i262.PostRepository>(() =>
        _i1039.PostRepositoryImpl(postDatasource: gh<_i1069.PostDatasource>()));
    gh.lazySingleton<_i551.AdUsecase>(
        () => _i551.AdUsecase(adRepository: gh<_i520.AdRepository>()));
    gh.lazySingleton<_i1003.ChatRepository>(() =>
        _i504.ChatRepositoryImpl(chatDataSource: gh<_i891.ChatDataSource>()));
    gh.factory<_i132.AdBloc>(
        () => _i132.AdBloc(adUsecase: gh<_i520.AdUsecase>()));
    gh.lazySingleton<_i193.ProfileRepository>(() => _i334.ProfileRepositoryImpl(
        profileDataSource: gh<_i49.ProfileDataSource>()));
    gh.lazySingleton<_i357.SearchRepository>(() => _i1017.SearchRepositoryImpl(
        searchDataSource: gh<_i461.SearchDataSource>()));
    gh.lazySingleton<_i430.PostUsecase>(
        () => _i430.PostUsecase(postRepository: gh<_i262.PostRepository>()));
    gh.lazySingleton<_i356.DiscussionUsecase>(() => _i356.DiscussionUsecase(
        discussionRepository: gh<_i931.DiscussionRepository>()));
    gh.lazySingleton<_i995.FeedUsecase>(
        () => _i995.FeedUsecase(feedRepository: gh<_i40.FeedRepository>()));
    gh.factory<_i708.AccountBloc>(
        () => _i708.AccountBloc(accountUsecase: gh<_i808.AccountUsecase>()));
    gh.lazySingleton<_i140.AuthRepository>(() =>
        _i153.AuthRepositoryImpl(authDataSource: gh<_i704.AuthDataSource>()));
    gh.lazySingleton<_i569.ChatUseCase>(
        () => _i569.ChatUseCase(chatRepository: gh<_i1003.ChatRepository>()));
    gh.lazySingleton<_i436.AuthUseCase>(
        () => _i436.AuthUseCase(authRepository: gh<_i140.AuthRepository>()));
    gh.lazySingleton<_i133.FirmRepository>(() =>
        _i689.FirmRepositoryImpl(firmDataSource: gh<_i300.FirmDataSource>()));
    gh.lazySingleton<_i996.ProfileUseCase>(() =>
        _i996.ProfileUseCase(profileRepository: gh<_i193.ProfileRepository>()));
    gh.lazySingleton<_i1062.SavedPostsRepository>(() =>
        _i595.SavedPostsRepositoryImpl(
            savedPostsDatasource: gh<_i358.SavedPostsDatasource>()));
    gh.lazySingleton<_i974.WizardUseCase>(() =>
        _i974.WizardUseCase(wizardRepository: gh<_i57.WizardRepository>()));
    gh.lazySingleton<_i40.NotificationsUsecase>(() => _i40.NotificationsUsecase(
        notificationsRepository: gh<_i661.NotificationsRepository>()));
    gh.lazySingleton<_i573.NetworkUseCase>(() =>
        _i573.NetworkUseCase(networkRepository: gh<_i318.NetworkRepository>()));
    gh.lazySingleton<_i797.AuthBloc>(
        () => _i797.AuthBloc(authUseCase: gh<_i140.AuthUseCase>()));
    gh.lazySingleton<_i1053.SearchUseCase>(() =>
        _i1053.SearchUseCase(searchRepository: gh<_i686.SearchRepository>()));
    gh.lazySingleton<_i398.ReferralUseCases>(() => _i398.ReferralUseCases(
        referralRepository: gh<_i386.ReferralRepository>()));
    gh.factory<_i65.ChatBloc>(() => _i65.ChatBloc(
          authBloc: gh<_i481.AuthBloc>(),
          networkUseCase: gh<_i318.NetworkUseCase>(),
          chatUseCase: gh<_i1003.ChatUseCase>(),
        ));
    gh.factory<_i1041.NotificationsBloc>(() => _i1041.NotificationsBloc(
        notificationsUsecase: gh<_i661.NotificationsUsecase>()));
    gh.factory<_i469.ProfileBloc>(() => _i469.ProfileBloc(
          authBloc: gh<_i481.AuthBloc>(),
          profileUseCase: gh<_i193.ProfileUseCase>(),
        ));
    gh.factory<_i896.PostBloc>(
        () => _i896.PostBloc(postUsecase: gh<_i262.PostUsecase>()));
    gh.lazySingleton<_i492.SavedPostsUsecase>(() => _i492.SavedPostsUsecase(
        savedPostsRepository: gh<_i1062.SavedPostsRepository>()));
    gh.lazySingleton<_i167.FirmUseCase>(
        () => _i167.FirmUseCase(firmRepository: gh<_i133.FirmRepository>()));
    gh.factory<_i991.WizardBloc>(
        () => _i991.WizardBloc(wizardUseCase: gh<_i974.WizardUseCase>()));
    gh.factory<_i179.NetworkBloc>(
        () => _i179.NetworkBloc(networkUseCase: gh<_i318.NetworkUseCase>()));
    gh.factory<_i355.DiscussionBloc>(() => _i355.DiscussionBloc(
          authBloc: gh<_i481.AuthBloc>(),
          discussionUsecase: gh<_i931.DiscussionUsecase>(),
        ));
    gh.factory<_i370.FirmBloc>(() => _i370.FirmBloc(
          firmUsecase: gh<_i133.FirmUseCase>(),
          profileUseCase: gh<_i193.ProfileUseCase>(),
        ));
    gh.factory<_i552.SearchBloc>(
        () => _i552.SearchBloc(searchUseCase: gh<_i686.SearchUseCase>()));
    gh.factory<_i494.ReferralBloc>(() =>
        _i494.ReferralBloc(referralUseCases: gh<_i386.ReferralUseCases>()));
    gh.singleton<_i774.FeedBloc>(() => _i774.FeedBloc(
          feedUsecase: gh<_i40.FeedUsecase>(),
          postUsecase: gh<_i262.PostUsecase>(),
          savedPostUseCase: gh<_i1062.SavedPostsUsecase>(),
          authBloc: gh<_i481.AuthBloc>(),
        ));
    gh.factory<_i192.SavedPostsBloc>(() => _i192.SavedPostsBloc(
        savedPostsUsecase: gh<_i1062.SavedPostsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
