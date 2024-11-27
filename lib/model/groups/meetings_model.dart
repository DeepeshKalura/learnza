import '../app_enums.dart';

class MeetingModel {
  final String id;
  final String groupId;
  final String organizerId;
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime endTime;
  final String meetLink;
  final List<String> invitedUserIds;
  final List<String> acceptedUserIds;
  final List<String> rejectedUserIds;
  final MeetingStatus status;

  MeetingModel({
    required this.id,
    required this.groupId,
    required this.organizerId,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    required this.meetLink,
    this.invitedUserIds = const [],
    this.acceptedUserIds = const [],
    this.rejectedUserIds = const [],
    this.status = MeetingStatus.scheduled,
  });
}
