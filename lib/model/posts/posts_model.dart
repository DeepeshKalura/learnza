import 'package:json_annotation/json_annotation.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class PostsModel {
  final String id;
  final String title;
  final String content;
  // User ID of the author
  final String authorId;

  final String? courseId;
  final String? departmentId;
  final List<String>? attachments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? scheduledAt;
  final bool isAnnouncement;

  PostsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    this.courseId,
    this.departmentId,
    this.attachments,
    required this.createdAt,
    required this.updatedAt,
    this.scheduledAt,
    required this.isAnnouncement,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}
