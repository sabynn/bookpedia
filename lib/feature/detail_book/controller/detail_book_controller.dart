import 'package:get/get.dart';
import '../../../domain/model/book.dart';

class DetailBookController {
  late final Book book;

  DetailBookController() {
    book = Book.fromJson(Get.arguments['book']);
  }
}
