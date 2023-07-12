import 'package:get/get.dart';

import '../../../core/design/atom/toast/base_toast.dart';
import '../../../core/router/base_router.dart';
import '../../../data/remote/request/register_body.dart';
import '../../../domain/base/response.dart';
import '../../../domain/model/user.dart';
import '../../../domain/use_case/register.dart';

class RegisterController {
  final RegisterUseCase _registerUseCase;

  RegisterController() : _registerUseCase = Get.find();

  RxBool registerLoading = false.obs;

  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void register() async {
    if (registerLoading.isFalse) {
      registerLoading.value = true;
      RegisterBody body = RegisterBody(
        name: username.value,
        email: email.value,
        password: password.value,
        passwordConfirmation: confirmPassword.value,
      );
      var response = await _registerUseCase.execute(body);
      if (response is Success<User>) {
        registerLoading.value = false;
        BaseToast.show(text: response.message, style: BaseToastStyle.SUCCESS);
        Get.toNamed(BaseRouter.login);
      } else {
        registerLoading.value = false;
        final err = response as Error;
        final message = err.error.toString().replaceAll('Exception: ', '');
        BaseToast.show(text: message, style: BaseToastStyle.DANGER);
      }
    }
  }
}
