import 'package:get/instance_manager.dart';

import '../../data/repository/app_repository.dart';
import '../base/response.dart';
import '../model/book.dart';

class GetAllBooksUseCase {
  final AppRepository _repository;

  GetAllBooksUseCase() : _repository = Get.find();

  Future<Response<List<Book>>> execute() async {
    late Response<List<Book>> response;

    await _repository.getAllBooks().then(
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
