import 'package:get/instance_manager.dart';

import '../../core/session/session_manager.dart';
import '../../data/remote/request/login_body.dart';
import '../../data/repository/app_repository.dart';
import '../base/response.dart';

class LoginUseCase {
  final AppRepository _repository;
  final SessionManager _sessionManager;

  LoginUseCase()
      : _sessionManager = Get.find(),
        _repository = Get.find();

  Future<Response> execute(LoginBody body) async {
    late Response response;

    await _repository.login(body).then(
      (baseResponse) {
        response = Success(
          baseResponse.token,
          baseResponse.message,
        );
        String? token = baseResponse.token;

        if (token != null) {
          _sessionManager.setLogin(token);
        }
      },
    ).catchError(
      (error) {
        response = Error(error);
      },
    );

    return response;
  }
}
