import 'package:get/get.dart';

import '../../domain/model/book.dart';
import '../../domain/model/user.dart';
import '../remote/request/add_book_body.dart';
import '../remote/request/login_body.dart';
import '../remote/request/register_body.dart';
import '../remote/response/base_response.dart';
import '../remote/response/login_response.dart';
import '../remote/service/app_service.dart';

class AppRepository {
  final AppService _service;

  AppRepository() : _service = Get.find();

  Future<BaseResponse<User>> register(RegisterBody body) {
    return _service.register(body);
  }

  Future<LoginResponse> login(LoginBody body) {
    return _service.login(body);
  }

  Future<User> getUser() {
    return _service.getUser();
  }

  Future<BaseResponse> logout() {
    return _service.logout();
  }

  Future<BaseResponse<Book>> addBook(AddBookBody body) {
    return _service.addBook(body);
  }

  Future<BaseResponse<List<Book>>> getAllBooks() {
    return _service.getAllBooks();
  }

  Future<BaseResponse<Book>> updateBook(
    String bookId,
    AddBookBody body,
  ) {
    return _service.updateBook(bookId, body);
  }

  Future<BaseResponse<Book>> deleteBook(
    String bookId,
  ) {
    return _service.deleteBook(bookId);
  }
}
