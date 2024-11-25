import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  const factory PostsModel({
    required String id,
    required String title,
    required String content,
    required String authorId,
    String? thumbnailUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? scheduledAt,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}
