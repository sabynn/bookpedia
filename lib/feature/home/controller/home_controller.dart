import 'package:get/get.dart';

import '../../../core/design/atom/toast/base_toast.dart';
import '../../../core/router/base_router.dart';
import '../../../core/session/session_manager.dart';
import '../../../domain/base/response.dart';
import '../../../domain/model/book.dart';
import '../../../domain/model/user.dart';
import '../../../domain/use_case/delete_book.dart';
import '../../../domain/use_case/get_all_books.dart';
import '../../../domain/use_case/logout.dart';

class HomeController {
  final SessionManager _sessionManager;
  final GetAllBooksUseCase _getAllBooksUseCase;
  final LogoutUseCase _logoutUseCase;
  final DeleteBookUseCase _deleteUseCase;

  HomeController()
      : _sessionManager = Get.find(),
        _logoutUseCase = Get.find(),
        _getAllBooksUseCase = Get.find(),
        _deleteUseCase = Get.find() {
    init();
  }

  RxBool getBookLoading = false.obs;
  RxString errMessage = ''.obs;
  var nameOfUser = ''.obs;
  Rx<List<Book>> listBooks = Rx([]);

  void init() {
    User? user = _sessionManager.user();
    if (user != null) {
      nameOfUser.value = user.name ?? '';
    }
  }

  void logout() async {
    await _logoutUseCase.execute();
    Get.toNamed(BaseRouter.getStarted);
  }

  void getBook() async {
    if (getBookLoading.isFalse) {
      getBookLoading.value = true;
      var response = await _getAllBooksUseCase.execute();

      if (response is Success<List<Book>>) {
        listBooks.value = response.data ?? [];
      } else {
        final err = response as Error;
        final message = err.error.toString().replaceAll('Exception: ', '');
        errMessage.value = message;
      }
    }
    getBookLoading.value = false;
  }

  void deleteBook(Book book) async {
    var response = await _deleteUseCase.execute('${book.id ?? 0}');

    if (response is Success<Book>) {
      final temp = [...listBooks.value];
      temp.remove(book);
      listBooks.value = temp;

      BaseToast.show(text: response.message, style: BaseToastStyle.SUCCESS);
    } else {
      final err = response as Error;
      final message = err.error.toString().replaceAll('Exception: ', '');
      BaseToast.show(text: message, style: BaseToastStyle.DANGER);
    }
  }
}
