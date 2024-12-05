// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BooksModelImpl _$$BooksModelImplFromJson(Map<String, dynamic> json) =>
    _$BooksModelImpl(
      id: json['id'] as String,
      isbn: json['isbn'] as String?,
      bookTitle: json['bookTitle'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      bookUrl: json['bookUrl'] as String?,
      thumbnail: json['thumbnail'] as String?,
      language: json['language'] as String,
      author:
          (json['author'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publisher: json['publisher'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      founded: json['founded'] as bool,
      editor: json['editor'] as String?,
      moreImageUrl: (json['moreImageUrl'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BooksModelImplToJson(_$BooksModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbn': instance.isbn,
      'bookTitle': instance.bookTitle,
      'description': instance.description,
      'code': instance.code,
      'bookUrl': instance.bookUrl,
      'thumbnail': instance.thumbnail,
      'language': instance.language,
      'author': instance.author,
      'categories': instance.categories,
      'publisher': instance.publisher,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'founded': instance.founded,
      'editor': instance.editor,
      'moreImageUrl': instance.moreImageUrl,
    };
