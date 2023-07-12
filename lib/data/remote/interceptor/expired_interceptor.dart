import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/router/base_router.dart';
import '../../../core/session/session_manager.dart';

class ExpiredInterceptor extends Interceptor {
  final SessionManager _sessionManager;

  ExpiredInterceptor() : _sessionManager = Get.find();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err.response?.statusCode == 401) {
      _sessionManager.logout();
      Get.toNamed(BaseRouter.login);
    }
  }
}
