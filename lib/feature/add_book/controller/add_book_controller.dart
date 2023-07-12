import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/design/atom/toast/base_toast.dart';
import '../../../core/router/base_router.dart';
import '../../../data/remote/request/add_book_body.dart';
import '../../../domain/base/response.dart';
import '../../../domain/model/book.dart';
import '../../../domain/use_case/add_book.dart';

class AddBookController {
  final AddBookUseCase _useCase;

  AddBookController() : _useCase = Get.find();

  RxBool addBookLoading = false.obs;

  var isbn = ''.obs;
  var title = ''.obs;
  var subtitle = ''.obs;
  var author = ''.obs;
  var published = TextEditingController(text: '');
  var publisher = ''.obs;
  var pages = ''.obs;
  var description = ''.obs;
  var website = ''.obs;

  void addBook() async {
    if (addBookLoading.isFalse) {
      addBookLoading.value = true;
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

      var response = await _useCase.execute(body);

      if (response is Success<Book>) {
        addBookLoading.value = false;
        BaseToast.show(text: response.message, style: BaseToastStyle.SUCCESS);
        Get.offAllNamed(BaseRouter.home);
      } else {
        addBookLoading.value = false;
        final err = response as Error;
        final message = err.error.toString().replaceAll('Exception: ', '');
        BaseToast.show(text: message, style: BaseToastStyle.DANGER);
      }
    }
  }
}
