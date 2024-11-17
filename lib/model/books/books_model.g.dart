// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksModel _$BooksModelFromJson(Map<String, dynamic> json) => BooksModel(
      author: json['author'] as String,
      id: json['id'] as String,
      bookTitle: json['bookTitle'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      coverImageUrl: json['coverImageUrl'] as String,
      moreImageUrl: (json['moreImageUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool,
      isbm: json['isbm'] as String,
    );

Map<String, dynamic> _$BooksModelToJson(BooksModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbm': instance.isbm,
      'bookTitle': instance.bookTitle,
      'description': instance.description,
      'author': instance.author,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'coverImageUrl': instance.coverImageUrl,
      'moreImageUrl': instance.moreImageUrl,
    };
