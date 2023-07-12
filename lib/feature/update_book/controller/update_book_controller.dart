import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/design/atom/toast/base_toast.dart';
import '../../../core/router/base_router.dart';
import '../../../data/remote/request/add_book_body.dart';
import '../../../domain/base/response.dart';
import '../../../domain/model/book.dart';
import '../../../domain/use_case/update_book.dart';

class UpdateBookController {
  final UpdateBookUseCase _useCase;

  var id = 0;
  var isbn = ''.obs;
  var title = ''.obs;
  var subtitle = ''.obs;
  var author = ''.obs;
  var published = TextEditingController(text: '');
  var publisher = ''.obs;
  var pages = ''.obs;
  var description = ''.obs;
  var website = ''.obs;

  UpdateBookController() : _useCase = Get.find() {
    final Book book = Book.fromJson(Get.arguments['book']);

    String date =
        DateFormat('y/MM/dd').format(DateTime.parse(book.published ?? ''));

    id = book.id ?? 0;
    isbn.value = book.isbn ?? '';
    title.value = book.title ?? '';
    title.value = book.title ?? '';
    subtitle.value = book.subtitle ?? '';
    author.value = book.author ?? '';
    published.text = date;
    publisher.value = book.publisher ?? '';
    pages.value = '${book.pages ?? ''}';
    description.value = book.description ?? '';
    website.value = book.website ?? '';
  }

  RxBool updateBookLoading = false.obs;

  void updateBook() async {
    if (updateBookLoading.isFalse) {
      updateBookLoading.value = true;
      AddBookBody body = AddBookBody(
        isbn: isbn.value,
        title: title.value,
        subtitle: subtitle.value,
        author: author.value,
        published: published.text,
        publisher: publisher.value,
        pages: pages.value,
        description: description.value,
        website: website.value,
      );

      var response = await _useCase.execute('$id', body);

      if (response is Success<Book>) {
        updateBookLoading.value = false;
        BaseToast.show(text: response.message, style: BaseToastStyle.SUCCESS);
        Get.offAllNamed(BaseRouter.home);
      } else {
        updateBookLoading.value = false;
        final err = response as Error;
        final message = err.error.toString().replaceAll('Exception: ', '');
        BaseToast.show(text: message, style: BaseToastStyle.DANGER);
      }
    }
  }
}
