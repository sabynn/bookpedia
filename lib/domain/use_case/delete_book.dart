import 'package:get/instance_manager.dart';

import '../../data/repository/app_repository.dart';
import '../base/response.dart';
import '../model/book.dart';

class DeleteBookUseCase {
  final AppRepository _repository;

  DeleteBookUseCase() : _repository = Get.find();

  Future<Response<Book>> execute(String bookId) async {
    late Response<Book> response;

    await _repository.deleteBook(bookId).then(
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
