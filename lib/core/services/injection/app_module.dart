// injection.dart
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:route_social_app/core/network/app_api.dart';
import 'package:route_social_app/core/network/dio_factory.dart';

import '../../network/network_info.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  NetworkInfoImpl get networkInfo => NetworkInfoImpl(internetConnectionChecker);

  @lazySingleton
  DioFactory get dioFactory => DioFactory();

  Dio get dio => dioFactory.getDio();

  @lazySingleton
  AppServiceClient get appServiceClient => AppServiceClient(dio);
}
