import 'package:get/get.dart';

import '../../../core/router/base_router.dart';
import '../../../core/session/session_manager.dart';

class SplashController {
  final SessionManager _sessionManager;

  SplashController() : _sessionManager = Get.find() {
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (_sessionManager.isLogin()) {
      Get.offAllNamed(BaseRouter.home);
      return;
    } else {
      Get.offAllNamed(BaseRouter.getStarted);
      return;
    }
  }
}
