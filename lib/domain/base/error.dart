class NoInternetException implements Exception {
  @override
  String toString() => 'No internet';
}

class UnknownException implements Exception {
  late Object _error;

  Object get error => _error;

  UnknownException(Object error) {
    _error = error;
  }

  @override
  String toString() {
    return _error.toString();
  }
}
