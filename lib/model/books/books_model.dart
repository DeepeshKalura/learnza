import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_enums.dart';

part 'books_model.freezed.dart';
part 'books_model.g.dart';

@freezed
class BooksModel with _$BooksModel {
  const factory BooksModel({
    required String id,
    required String isbm, // 13 digits for easier usage
    required String bookTitle,
    required String description,
    String? code,
    String? bookUrl,
    required List<String> author,
    @Default([]) List<String> category, // Defaults to an empty list
    String? publisher,
    List<IndustryIdentifiers>? identifier,
    required bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    required String language,
    String? coverImageUrl,
    required bool founded,
    List<String>? moreImageUrl,
  }) = _BooksModel;

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);
}

@freezed
class IndustryIdentifiers with _$IndustryIdentifiers {
  const factory IndustryIdentifiers({
    required BookIdentityType type,
    required String identifier,
  }) = _IndustryIdentifiers;

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);
}
