import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable()
class RegisterBody {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'password_confirmation')
  String? passwordConfirmation;

  RegisterBody({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
