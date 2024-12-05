import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_model.freezed.dart';
part 'books_model.g.dart';

@freezed
class BooksModel with _$BooksModel {
  const factory BooksModel({
    required String id,
    String? isbn,
    String? bookTitle,
    String? description,
    String? code,
    String? bookUrl,
    String? thumbnail,
    required String language,
    List<String>? author, // Changed to nullable
    @Default([]) List<String> categories, // Kept as non-nullable with default
    String? publisher, // Changed to nullable
    required bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    required bool founded,
    String? editor,
    @Default([]) List<String> moreImageUrl,
  }) = _BooksModel;

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);
}
