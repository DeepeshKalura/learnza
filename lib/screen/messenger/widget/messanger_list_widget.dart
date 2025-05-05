import 'package:flutter/material.dart';

import '../../../interface/messenger_interface.dart';
import '../../../model/groups/groups_model.dart';
import '../../../model/users/users_model.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/resource_util.dart';

class MessengerListWidget extends StatelessWidget {
  const MessengerListWidget({
    super.key,
    required this.consumer,
    required this.onTap,
  });

  final MessengerInterface consumer;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // Assuming both models have a way to get an avatar/image
        child: ImageUtils.load(
          urlOrAsset: consumer.imageUrl,
          defaultAsset: ResourceUtil.defaultProfileImage,
        ),
      ),
      title: Text(consumer.name),
      subtitle: Text(consumer.source is UsersModel
          ? consumer.source.email
          : '${(consumer.source as GroupsModel).members.length} members'),
      onTap: onTap,
    );
  }
}
