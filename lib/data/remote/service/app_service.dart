import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';

import '../../../core/constants/endpoints.dart';
import '../../../domain/model/book.dart';
import '../../../domain/model/user.dart';
import '../client/api_dio.dart';
import '../request/add_book_body.dart';
import '../request/login_body.dart';
import '../request/register_body.dart';
import '../response/base_response.dart';
import '../response/login_response.dart';

part 'app_service.g.dart';

@RestApi()
abstract class AppService {
  factory AppService(ApiDio dio, {String baseUrl}) = _AppService;

  @POST(BaseEndpoints.register)
  Future<BaseResponse<User>> register(@Body() RegisterBody body);

  @POST(BaseEndpoints.login)
  Future<LoginResponse> login(@Body() LoginBody body);

  @GET(BaseEndpoints.user)
  Future<User> getUser();

  @DELETE(BaseEndpoints.logout)
  Future<BaseResponse> logout();

  @POST(BaseEndpoints.addBook)
  Future<BaseResponse<Book>> addBook(@Body() AddBookBody body);

  @GET(BaseEndpoints.books)
  Future<BaseResponse<List<Book>>> getAllBooks();

  @PUT('${BaseEndpoints.books}/{book_id}/edit')
  Future<BaseResponse<Book>> updateBook(
    @Path('book_id') String bookId,
    @Body() AddBookBody body,
  );

  @DELETE('${BaseEndpoints.books}/{book_id}')
  Future<BaseResponse<Book>> deleteBook(
    @Path('book_id') String bookId,
  );
}
