// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BooksModelImpl _$$BooksModelImplFromJson(Map<String, dynamic> json) =>
    _$BooksModelImpl(
      id: json['id'] as String,
      isbm: json['isbm'] as String,
      bookTitle: json['bookTitle'] as String,
      description: json['description'] as String,
      code: json['code'] as String?,
      bookUrl: json['bookUrl'] as String?,
      author:
          (json['author'] as List<dynamic>).map((e) => e as String).toList(),
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publisher: json['publisher'] as String?,
      identifier: (json['identifier'] as List<dynamic>?)
          ?.map((e) => IndustryIdentifiers.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      language: json['language'] as String,
      coverImageUrl: json['coverImageUrl'] as String?,
      founded: json['founded'] as bool,
      moreImageUrl: (json['moreImageUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BooksModelImplToJson(_$BooksModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbm': instance.isbm,
      'bookTitle': instance.bookTitle,
      'description': instance.description,
      'code': instance.code,
      'bookUrl': instance.bookUrl,
      'author': instance.author,
      'category': instance.category,
      'publisher': instance.publisher,
      'identifier': instance.identifier,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'language': instance.language,
      'coverImageUrl': instance.coverImageUrl,
      'founded': instance.founded,
      'moreImageUrl': instance.moreImageUrl,
    };

_$IndustryIdentifiersImpl _$$IndustryIdentifiersImplFromJson(
        Map<String, dynamic> json) =>
    _$IndustryIdentifiersImpl(
      type: $enumDecode(_$BookIdentityTypeEnumMap, json['type']),
      identifier: json['identifier'] as String,
    );

Map<String, dynamic> _$$IndustryIdentifiersImplToJson(
        _$IndustryIdentifiersImpl instance) =>
    <String, dynamic>{
      'type': _$BookIdentityTypeEnumMap[instance.type]!,
      'identifier': instance.identifier,
    };

const _$BookIdentityTypeEnumMap = {
  BookIdentityType.isbn_10: 'isbn_10',
  BookIdentityType.isbn_13: 'isbn_13',
};
