import 'package:dio/dio.dart';

import 'error.dart';

abstract class Response<T> {}

class Empty<T> extends Response<T> {}

class Error<T> extends Response<T> {
  late Exception _error;

  Exception get error => _error;
  int status = -1;

  Error(Object error) {
    if (error is DioException) {
      status = error.response?.statusCode ?? -1;
      String? msg = error.response?.data['message'];
      _error = Exception(msg ?? error.message);
    } else if (error is Exception) {
      _error = error;
    } else {
      _error = UnknownException(error);
    }
  }
}

class Success<T> extends Response<T> {
  final T? data;

  final String? message;

  Success(this.data, this.message);
}
