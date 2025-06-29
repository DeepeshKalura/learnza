import '../model/groups/groups_model.dart';
import '../model/users/users_model.dart';

class MessengerInterface {
  final dynamic source;
  final bool isGroup;

  MessengerInterface(this.source) : isGroup = source is GroupsModel {
    if (source is! UsersModel && source is! GroupsModel) {
      throw ArgumentError('Source must be either a UsersModel or GroupsModel');
    }
  }

  String get id =>
      isGroup ? (source as GroupsModel).id : (source as UsersModel).uid;

  String get name =>
      isGroup ? (source as GroupsModel).name : (source as UsersModel).fullName;

  String? get imageUrl => isGroup
      ? (source as GroupsModel).imageUrl
      : (source as UsersModel).profileImageURL;

  String get initialLetters =>
      name.isNotEmpty ? name.substring(0, isGroup ? 2 : 1) : "?";

  bool get isOnline => isGroup ? false : (source as UsersModel).isOnline;

  String? get lastSeen => isGroup ? null : (source as UsersModel).lastSeen;

  bool isUserBlocked(String userId) =>
      isGroup ? false : (source as UsersModel).blockedUsers.contains(userId);

  // Helper method to get the appropriate tag for Hero animations
  String get heroTag => id;

  // Add any other common properties or methods you need
}
