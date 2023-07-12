import 'package:get/instance_manager.dart';

import '../../data/remote/request/add_book_body.dart';
import '../../data/repository/app_repository.dart';
import '../base/response.dart';
import '../model/book.dart';

class UpdateBookUseCase {
  final AppRepository _repository;

  UpdateBookUseCase() : _repository = Get.find();

  Future<Response<Book>> execute(String bookId, AddBookBody body) async {
    late Response<Book> response;

    await _repository.updateBook(bookId, body).then(
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
