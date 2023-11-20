import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_social_app/core/utils/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  DioFactory();

  Dio getDio() {
    Dio dio = Dio();

    Map<String, String> headers = {
      AUTHORIZATION: Constants.token,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
        sendTimeout: const Duration(milliseconds: Constants.apiTimeOut));

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
