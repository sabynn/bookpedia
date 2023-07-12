class User {
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  User({
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
