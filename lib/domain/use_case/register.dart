import 'package:get/instance_manager.dart';

import '../../data/remote/request/register_body.dart';
import '../../data/repository/app_repository.dart';
import '../base/response.dart';
import '../model/user.dart';

class RegisterUseCase {
  final AppRepository _repository;

  RegisterUseCase() : _repository = Get.find();

  Future<Response<User>> execute(
    RegisterBody registerBody,
  ) async {
    late Response<User> response;

    await _repository.register(registerBody).then(
      (baseResponse) {
        response = Success(
          baseResponse.data,
          baseResponse.message,
        );
      },
    ).catchError(
      (error) {
        response = Error(error);
      },
    );

    return response;
  }
}
