import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LoginResponse<T> {
  final String? token;
  final String? message;

  LoginResponse(this.token, this.message);

  factory LoginResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$LoginResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$LoginResponseToJson(this, toJsonT);
}
