class UserToken {
  String? token;

  UserToken({
    this.token,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) => UserToken(
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
