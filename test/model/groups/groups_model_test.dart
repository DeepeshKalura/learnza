import 'package:flutter_test/flutter_test.dart';
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/model/groups/groups_model.dart';

void main() {
  group('GroupsModel', () {
    test('should create a valid GroupsModel instance', () {
      final group = GroupsModel(
        id: '1',
        name: 'Test Group',
        description: 'A test group',
        imageUrl: 'http://example.com/image.png',
        coverImageUrl: 'http://example.com/cover.png',
        members: [
          const GroupMember(
            id: "admin1",
            role: GroupRole.admin,
          ),
          const GroupMember(
            id: "member1",
            role: GroupRole.member,
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(group.id, '1');
      expect(group.name, 'Test Group');
      expect(group.description, 'A test group');
      expect(group.imageUrl, 'http://example.com/image.png');
      expect(group.coverImageUrl, 'http://example.com/cover.png');
      expect(group.members.length, 2);
      expect(group.members[0].id, "admin1");
      expect(group.members[0].role, GroupRole.admin);
      expect(group.members[1].id, "member1");
      expect(group.members[1].role, GroupRole.member);
      expect(group.privacy, GroupPrivacy.private);
      expect(group.pendingInvites, []);
    });

    test('should support copyWith', () {
      final group = GroupsModel(
        id: '1',
        name: 'Test Group',
        description: 'A test group',
        imageUrl: 'http://example.com/image.png',
        coverImageUrl: 'http://example.com/cover.png',
        members: [
          const GroupMember(
            id: "admin1",
            role: GroupRole.admin,
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final updatedGroup = group.copyWith(name: 'Updated Group');

      expect(updatedGroup.id, '1');
      expect(updatedGroup.name, 'Updated Group');
      expect(updatedGroup.description, 'A test group');
      expect(updatedGroup.imageUrl, 'http://example.com/image.png');
      expect(updatedGroup.coverImageUrl, 'http://example.com/cover.png');
      expect(updatedGroup.members.length, 1);
      expect(updatedGroup.members[0].id, "admin1");
      expect(updatedGroup.members[0].role, GroupRole.admin);
      expect(updatedGroup.privacy, GroupPrivacy.private);
      expect(updatedGroup.pendingInvites, []);
    });

    test('should filter admins and members correctly', () {
      final group = GroupsModel(
        id: '1',
        name: 'Test Group',
        members: [
          const GroupMember(
            id: "admin1",
            role: GroupRole.admin,
          ),
          const GroupMember(
            id: "member1",
            role: GroupRole.member,
          ),
          const GroupMember(
            id: "admin2",
            role: GroupRole.admin,
          ),
          const GroupMember(
            id: "member2",
            role: GroupRole.member,
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final admins =
          group.members.where((m) => m.role == GroupRole.admin).toList();
      final members =
          group.members.where((m) => m.role == GroupRole.member).toList();

      expect(admins.length, 2);
      expect(admins.map((a) => a.id), containsAll(["admin1", "admin2"]));
      expect(members.length, 2);
      expect(members.map((m) => m.id), containsAll(["member1", "member2"]));
    });

    test('should handle default privacy and pendingInvites', () {
      final group = GroupsModel(
        id: '1',
        name: 'Test Group',
        members: [
          const GroupMember(
            id: "admin1",
            role: GroupRole.admin,
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(group.privacy, GroupPrivacy.private);
      expect(group.pendingInvites, isEmpty);
    });
  });

  test("Serialization and Deserialization", () {
    final json = {
      "createdAt": "2024-11-27T16:36:02.241771",
      "pendingInvites": [],
      "coverImageUrl":
          "https://firebasestorage.googleapis.com/v0/b/learnza.firebasestorage.app/o/group_images%2FaYvwYOloutZyrpmCCEEu%2F1732705562253?alt=media&token=23c3b78e-8cb9-4d69-afe7-fba75d705d09",
      "imageUrl":
          "https://firebasestorage.googleapis.com/v0/b/learnza.firebasestorage.app/o/group_images%2FulmvcnIxpZfcv7ROMbZW%2F1732705567219?alt=media&token=d0523bfd-1bb8-4f10-ad36-458338cc6dcf",
      "members": [
        {"role": "admin", "id": "703b4ed3-04da-4fb8-9304-6ed4381307db"}
      ],
      "name": "Building Lover",
      "description":
          "We love building so we will create and create them to make it modern world",
      "privacy": "public",
      "id": "e898e745-90f8-4d53-b3e0-a3c2996d9b6b",
      "updatedAt": "2024-11-27T16:36:02.241777"
    };
    final group = GroupsModel.fromJson(json);

    expect(group.id, 'e898e745-90f8-4d53-b3e0-a3c2996d9b6b');
    expect(group.name, 'Building Lover');
    expect(group.description,
        'We love building so we will create and create them to make it modern world');

    expect(group.members.length, 1);
    expect(group.members[0].id, '703b4ed3-04da-4fb8-9304-6ed4381307db');
    expect(group.members[0].role, GroupRole.admin);
  });
}
