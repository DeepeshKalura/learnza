import '../app_enums.dart';

class AttachmentModel {
  final String id;
  final String messageId;
  final AttachmentType type;
  final String url;
  final String? thumbnailUrl;
  final int? fileSize;
  final String? fileName;

  AttachmentModel({
    required this.id,
    required this.messageId,
    required this.type,
    required this.url,
    this.thumbnailUrl,
    this.fileSize,
    this.fileName,
  });
}
