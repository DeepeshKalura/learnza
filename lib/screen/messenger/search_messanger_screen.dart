import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../interface/messenger_interface.dart';
import '../../model/app_enums.dart' show SearchType;
import '../../providers/state/messanger/messanger_state_provider.dart';
import '../../router/app_urls.dart';
import 'widget/messanger_list_widget.dart';

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
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  void _handleTabChange() {
    context.read<MessengerStateProvider>().switchSearchType(
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
            hintText:
                'Search for ${provider.currentSearchType == SearchType.people ? "people" : "groups"}...',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      provider.clearSearch();
                    },
                  )
                : null,
          ),
          onChanged: provider.performSearch,
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
    final isLoading =
        isGroups ? provider.isGroupsLoading : provider.isPeopleLoading;
    final results =
        isGroups ? provider.searchGroupsResults : provider.searchPeopleResults;
    final query = _searchController.text.trim();

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (query.isEmpty) {
      return const Center(child: Text('Please enter a search term.'));
    }

    if (results.isEmpty) {
      return Center(
        child: Text(isGroups ? 'No groups found' : 'No people found'),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final consumer = MessengerInterface(results[index]);
        return MessengerListWidget(
          consumer: consumer,
          onTap: () {
            // --- CORRECTED NAVIGATION ---
            context.pushNamed(
              AppUrls.messageConsumerScreen,
              pathParameters: {'conversationId': consumer.id},
              extra: {
                'isGroup': consumer.isGroup,
                'data': consumer.source,
              },
            );
          },
        );
      },
    );
  }
}
