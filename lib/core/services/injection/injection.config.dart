// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:route_social_app/core/network/app_api.dart' as _i3;
import 'package:route_social_app/core/network/dio_factory.dart' as _i5;
import 'package:route_social_app/core/network/network_info.dart' as _i8;
import 'package:route_social_app/core/services/injection/app_module.dart'
    as _i15;
import 'package:route_social_app/Features/home/data/remote/data_sources/home_remote_data_source.dart'
    as _i6;
import 'package:route_social_app/Features/home/data/repositories/repository_impl.dart'
    as _i10;
import 'package:route_social_app/Features/home/domain/repositories/repository.dart'
    as _i9;
import 'package:route_social_app/Features/home/domain/use_cases/get_comments.dart'
    as _i11;
import 'package:route_social_app/Features/home/domain/use_cases/get_posts.dart'
    as _i12;
import 'package:route_social_app/Features/home/domain/use_cases/get_users.dart'
    as _i13;
import 'package:route_social_app/Features/home/presentation/cubit/home_cubit.dart'
    as _i14;

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
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.AppServiceClient>(
        () => injectableModule.appServiceClient);
    gh.factory<_i4.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i5.DioFactory>(() => injectableModule.dioFactory);
    gh.factory<_i6.HomeRemoteDataSource>(
        () => _i6.HomeRemoteDataSourceImpl(gh<_i3.AppServiceClient>()));
    gh.lazySingleton<_i7.InternetConnectionChecker>(
        () => injectableModule.internetConnectionChecker);
    gh.factory<_i8.NetworkInfo>(
        () => _i8.NetworkInfoImpl(gh<_i7.InternetConnectionChecker>()));
    gh.lazySingleton<_i8.NetworkInfoImpl>(() => injectableModule.networkInfo);
    gh.factory<_i9.HomeRepository>(() => _i10.HomeRepositoryImpl(
          gh<_i6.HomeRemoteDataSource>(),
          gh<_i8.NetworkInfo>(),
        ));
    gh.factory<_i11.GetCommentsUseCase>(
        () => _i11.GetCommentsUseCase(gh<_i9.HomeRepository>()));
    gh.factory<_i12.GetPostsUseCase>(
        () => _i12.GetPostsUseCase(gh<_i9.HomeRepository>()));
    gh.factory<_i13.GetUsersUseCase>(
        () => _i13.GetUsersUseCase(gh<_i9.HomeRepository>()));
    gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(
          gh<_i13.GetUsersUseCase>(),
          gh<_i12.GetPostsUseCase>(),
          gh<_i11.GetCommentsUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i15.InjectableModule {}
