import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel {
  final String id;
  final String isbm;
  final String bookTitle;
  final String description;
  final String author;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String coverImageUrl;
  final List<String>? moreImageUrl;

  BooksModel({
    required this.author,
    required this.id,
    required this.bookTitle,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.coverImageUrl,
    this.moreImageUrl,
    required this.isActive,
    required this.isbm,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}
