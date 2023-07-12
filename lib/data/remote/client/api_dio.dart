import 'package:dio/io.dart';

import '../../../core/constants/endpoints.dart';
import '../interceptor/expired_interceptor.dart';
import '../interceptor/header_interceptior.dart';
import '../interceptor/log_interceptor.dart';

class ApiDio extends DioForNative {
  ApiDio() {
    _configureOptions();
    _configureInterceptors();
  }

  void _configureOptions() {
    options.baseUrl = BaseEndpoints.baseUrl;
  }

  void _configureInterceptors() {
    interceptors.add(LogInterceptor());
    interceptors.add(ExpiredInterceptor());
    interceptors.add(HeaderInterceptor());
  }
}
