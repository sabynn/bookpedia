import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/session/session_manager.dart';

class HeaderInterceptor extends Interceptor {
  final SessionManager _sessionManager;

  HeaderInterceptor() : _sessionManager = Get.find();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = _sessionManager.token() ?? '';
    options.headers['Accept'] = 'application/json';
    if (token.isNotEmpty) options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }
}
