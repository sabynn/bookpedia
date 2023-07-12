import 'package:get/instance_manager.dart';

import '../../core/session/session_manager.dart';
import '../../data/remote/request/login_body.dart';
import '../../data/repository/app_repository.dart';
import '../model/user.dart';

class UserUseCase {
  final AppRepository _repository;
  final SessionManager _sessionManager;

  UserUseCase()
      : _sessionManager = Get.find(),
        _repository = Get.find();

  Future<User?> execute(LoginBody body) async {
    User? response;

    await _repository.getUser().then(
      (baseResponse) {
        response = baseResponse;
        if (response != null && _sessionManager.user() == null) {
          _sessionManager.setUser(response!);
        }
      },
    );

    return response;
  }
}
