import 'package:get/get.dart';

import '../../../core/design/atom/toast/base_toast.dart';
import '../../../core/router/base_router.dart';
import '../../../data/remote/request/login_body.dart';
import '../../../domain/base/response.dart';
import '../../../domain/use_case/login.dart';
import '../../../domain/use_case/user.dart';

class LoginController {
  final LoginUseCase _loginUseCase;
  final UserUseCase _userUseCase;

  LoginController()
      : _loginUseCase = Get.find(),
        _userUseCase = Get.find();

  RxBool loginLoading = false.obs;

  var email = ''.obs;
  var password = ''.obs;

  void login() async {
    if (loginLoading.isFalse) {
      loginLoading.value = true;
      LoginBody body = LoginBody(
        email: email.value,
        password: password.value,
      );
      var response = await _loginUseCase.execute(body);
      if (response is Success<dynamic>) {
        await _userUseCase.execute(body);

        loginLoading.value = false;
        BaseToast.show(text: response.message, style: BaseToastStyle.SUCCESS);

        Get.toNamed(BaseRouter.home);
      } else {
        loginLoading.value = false;
        final err = response as Error;
        final message = err.error.toString().replaceAll('Exception: ', '');
        BaseToast.show(text: message, style: BaseToastStyle.DANGER);
      }
    }
  }
}
