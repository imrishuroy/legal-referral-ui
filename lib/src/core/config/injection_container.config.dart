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
import '../../features/auth/data/repositories/auth_repository_impl.dart' as _i6;
import '../../features/auth/domain/domain.dart' as _i5;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i7;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i8;
import '../network/network.dart' as _i3;
import 'api_client_module.dart' as _i9;

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
    gh.lazySingleton<_i5.AuthRepository>(
        () => _i6.AuthRepositoryImpl(authDataSource: gh<_i4.AuthDataSource>()));
    gh.lazySingleton<_i7.AuthUseCase>(
        () => _i7.AuthUseCase(authRepository: gh<_i5.AuthRepository>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i8.AuthBloc>(
        () => _i8.AuthBloc(authUseCase: gh<_i5.AuthUseCase>()));
    return this;
  }
}

class _$APIClientModule extends _i9.APIClientModule {}
