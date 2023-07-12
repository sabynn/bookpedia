import 'package:get/instance_manager.dart';

import '../../core/session/session_manager.dart';
import '../../data/repository/app_repository.dart';
import '../base/response.dart';

class LogoutUseCase {
  final AppRepository _repository;
  final SessionManager _sessionManager;

  LogoutUseCase()
      : _sessionManager = Get.find(),
        _repository = Get.find();

  Future<Response<String>> execute() async {
    late Response<String> response;

    await _repository.logout().then(
      (baseResponse) {
        response = Success(
          baseResponse.data,
          baseResponse.message,
        );
        _sessionManager.logout();
      },
    ).catchError(
      (error) {
        response = Error(error);
      },
    );

    return response;
  }
}
