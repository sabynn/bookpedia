import 'package:get/get.dart';

import '../feature/add_book/controller/add_book_controller.dart';
import '../feature/home/controller/home_controller.dart';
import '../feature/intro/controller/splash_controller.dart';
import '../feature/login/controller/login_controller.dart';
import '../feature/registration/controller/register_controller.dart';
import '../feature/update_book/controller/update_book_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class AddBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBookController());
  }
}

class UpdateBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateBookController());
  }
}
