import 'package:json_annotation/json_annotation.dart';

part 'add_book_body.g.dart';

@JsonSerializable()
class AddBookBody {
  @JsonKey(name: 'isbn')
  String? isbn;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'subtitle')
  String? subtitle;
  @JsonKey(name: 'author')
  String? author;
  @JsonKey(name: 'published')
  String? published;
  @JsonKey(name: 'publisher')
  String? publisher;
  @JsonKey(name: 'pages')
  String? pages;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'website')
  String? website;

  AddBookBody({
    this.isbn,
    this.title,
    this.subtitle,
    this.author,
    this.published,
    this.publisher,
    this.pages,
    this.description,
    this.website,
  });

  factory AddBookBody.fromJson(Map<String, dynamic> json) =>
      _$AddBookBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddBookBodyToJson(this);
}
