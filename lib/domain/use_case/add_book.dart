import 'package:get/instance_manager.dart';

import '../../data/remote/request/add_book_body.dart';
import '../../data/repository/app_repository.dart';
import '../base/response.dart';
import '../model/book.dart';

class AddBookUseCase {
  final AppRepository _repository;

  AddBookUseCase() : _repository = Get.find();

  Future<Response<Book>> execute(AddBookBody body) async {
    late Response<Book> response;

    await _repository.addBook(body).then(
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
