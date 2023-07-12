import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../di/bindings.dart';
import '../../feature/add_book/presentation/page/_page.dart';
import '../../feature/detail_book/presentation/page/_page.dart';
import '../../feature/home/presentation/page/_page.dart';
import '../../feature/intro/presentation/page/_page.dart';
import '../../feature/login/presentation/page/_page.dart';
import '../../feature/registration/presentation/page/_page.dart';
import '../../feature/update_book/presentation/page/_page.dart';

class BaseRouter {
  static const splashScreen = '/';
  static const getStarted = '/get-started';
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const addBook = '/add-book';
  static const detailBook = '/detail-book';
  static const updateBook = '/update-book';
}

List<GetPage> getPages = [
  GetPage(
    name: BaseRouter.splashScreen,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: BaseRouter.getStarted,
    page: () => const GetStartedPage(),
  ),
  GetPage(
    name: BaseRouter.register,
    page: () => const RegisterPage(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: BaseRouter.login,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: BaseRouter.home,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: BaseRouter.addBook,
    page: () => const AddBookPage(),
    binding: AddBookBinding(),
  ),
  GetPage(
    name: BaseRouter.updateBook,
    page: () => const UpdateBookPage(),
    binding: UpdateBookBinding(),
  ),
  GetPage(
    name: BaseRouter.detailBook,
    page: () => const DetailBookPage(),
  ),
];
