class BaseEndpoints {
  static const String baseUrl =
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api';
  static const String register = '/register';
  static const String login = '/login';
  static const String user = '/user';
  static const String logout = '$user/logout';
  static const String books = '/books';
  static const String addBook = '$books/add';
}
