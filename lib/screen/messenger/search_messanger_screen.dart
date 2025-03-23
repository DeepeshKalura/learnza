import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/router/app_urls.dart';
import 'package:provider/provider.dart';

import '../../model/app_enums.dart' show SearchType;
import '../../model/groups/groups_model.dart';
import '../../model/users/users_model.dart';
import '../../providers/state/messanger/messanger_state_provider.dart';
import '../../utils/resource_util.dart';

class SearchMessengerScreen extends StatefulWidget {
  const SearchMessengerScreen({super.key});

  @override
  State<SearchMessengerScreen> createState() => _SearchMessengerScreenState();
}

class _SearchMessengerScreenState extends State<SearchMessengerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );

    // Listen to tab changes to update search type
    _tabController.addListener(_handleTabChange);

    // Automatically focus on the search field when the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  void _handleTabChange() {
    final provider = context.read<MessengerStateProvider>();
    provider.switchSearchType(
        _tabController.index == 0 ? SearchType.people : SearchType.groups);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MessengerStateProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      provider.clearSearch();
                      FocusScope.of(context).requestFocus(_searchFocusNode);
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            provider.performSearch(value);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'People'),
            Tab(text: 'Groups'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSearchResultsList(context, isGroups: false),
          _buildSearchResultsList(context, isGroups: true),
        ],
      ),
    );
  }

  Widget _buildSearchResultsList(BuildContext context,
      {required bool isGroups}) {
    final provider = context.watch<MessengerStateProvider>();

    // Determine loading and results based on search type
    final isLoading =
        isGroups ? provider.isGroupsLoading : provider.isPeopleLoading;
    final results =
        isGroups ? provider.searchGroupsResults : provider.searchPeopleResults;

    // If loading, show a loading indicator
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // If no results, show a message
    if (results.isEmpty) {
      return Center(
        child: Text(
          isGroups ? 'No groups found' : 'No people found',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    // Build list of results
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: CircleAvatar(
            // Assuming both models have a way to get an avatar/image
            backgroundImage: item is UsersModel
                ? const NetworkImage(ResourceUtil.defaultProfileImage)
                : NetworkImage((item as GroupsModel).coverImageUrl ??
                    ResourceUtil.defaultProfileImage),
          ),
          title: Text(
              item is UsersModel ? item.fullName : (item as GroupsModel).name),
          subtitle: Text(item is UsersModel
              ? item.email
              : '${(item as GroupsModel).members.length} members'),
          onTap: () async {
            if (item is UsersModel) {
              await provider.addPersonOrGroupToMessangerForUser(
                userId: item.uid,
              );

              context.pushNamed(
                AppUrls.userMessageScreen,
                extra: {'user': item},
              );
            } else if (item is GroupsModel) {
              await provider.addPersonOrGroupToMessangerForUser(
                groupId: item.id,
              );

              context.pushNamed(
                AppUrls.groupMessageStudentScreen,
                extra: {'group': item},
              );
            }
          },
        );
      },
    );
  }
}
