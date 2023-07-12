import 'package:get/get.dart';

import '../core/session/session_manager.dart';
import '../data/remote/client/api_dio.dart';
import '../data/remote/service/app_service.dart';
import '../data/repository/app_repository.dart';
import '../domain/use_case/add_book.dart';
import '../domain/use_case/delete_book.dart';
import '../domain/use_case/get_all_books.dart';
import '../domain/use_case/login.dart';
import '../domain/use_case/logout.dart';
import '../domain/use_case/register.dart';
import '../domain/use_case/update_book.dart';
import '../domain/use_case/user.dart';

void initDependencyInjections() {
  // core
  Get.lazyPut(() => SessionManager());
  Get.lazyPut(() => AppService(Get.find()));
  Get.lazyPut(() => ApiDio());
  Get.put(AppRepository(), permanent: true);

  // use case
  Get.put(LogoutUseCase(), permanent: true);
  Get.put(RegisterUseCase(), permanent: true);
  Get.put(LoginUseCase(), permanent: true);
  Get.put(UserUseCase(), permanent: true);
  Get.put(AddBookUseCase(), permanent: true);
  Get.put(DeleteBookUseCase(), permanent: true);
  Get.put(UpdateBookUseCase(), permanent: true);
  Get.put(GetAllBooksUseCase(), permanent: true);
}
