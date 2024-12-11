enum UserRole { admin, teacher, student, bot }

enum GroupPrivacy { public, private, restricted }

enum MessageType { text, image, video, audio, document, location }

enum MessageStatus { sending, sent, delivered, read }

enum MeetingStatus { scheduled, inProgress, completed, cancelled }

enum NotificationType {
  groupInvite,
  newMessage,
  meetingInvite,
  groupJoin,
  groupLeave,
  adminPromotion
}

enum AttachmentType { image, video, audio, document, other }

enum Environment { development, production }

enum PostVisibility { public, private, restricted, draft }

enum CommentStatus {
  active,
  hidden,
  deleted,
  reported,
}
