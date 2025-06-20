import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;
import 'package:learnza/model/app_enums.dart';
import 'package:learnza/model/groups/groups_model.dart';
import 'package:learnza/model/users/users_model.dart';

import '../../../interface/messenger_interface.dart';
import '../../model/groups_provider.dart' as model_groups_provider;
import '../../model/message_provider.dart';
import '../../model/users_provider.dart' as model_users_provider;

class MessengerStateProvider extends ChangeNotifier {
  // Get the single, authoritative MessageProvider from GetIt
  final MessageProvider _messageProvider = di.injector<MessageProvider>();

  // State variables for the main chat list
  List<MessengerInterface> chatList = [];
  bool isChatListLoading = false;
  String? chatListError;

  // State variables for the search functionality
  SearchType _currentSearchType = SearchType.people;
  String _currentQuery = '';
  List<UsersModel> _searchPeopleResults = [];
  List<GroupsModel> _searchGroupsResults = [];
  bool _isPeopleLoading = false;
  bool _isGroupsLoading = false;

  // Getters
  SearchType get currentSearchType => _currentSearchType;
  List<UsersModel> get searchPeopleResults => _searchPeopleResults;
  List<GroupsModel> get searchGroupsResults => _searchGroupsResults;
  bool get isPeopleLoading => _isPeopleLoading;
  bool get isGroupsLoading => _isGroupsLoading;
  bool get isSearchLoading => _isPeopleLoading || _isGroupsLoading;

  // --- Main Chat List Logic ---

  Future<void> fetchChatList() async {
    isChatListLoading = true;
    chatListError = null;
    notifyListeners();
    try {
      // Use the unified provider to get the list of active chats
      chatList = await _messageProvider.getChatList();
    } catch (e) {
      developer.log('Error retrieving user messenger list', error: e);
      chatListError = e.toString();
    } finally {
      isChatListLoading = false;
      notifyListeners();
    }
  }

  // --- Search Logic ---

  void switchSearchType(SearchType type) {
    if (_currentSearchType != type) {
      _currentSearchType = type;
      if (_currentQuery.isNotEmpty) {
        performSearch(_currentQuery);
      }
      notifyListeners();
    }
  }

  Future<void> performSearch(String query) async {
    _currentQuery = query.trim();
    if (_currentQuery.isEmpty) {
      clearSearch();
      return;
    }

    if (_currentSearchType == SearchType.people) {
      _isPeopleLoading = true;
    } else {
      _isGroupsLoading = true;
    }
    notifyListeners();

    try {
      if (_currentSearchType == SearchType.people) {
        _searchPeopleResults = await di
            .injector<model_users_provider.UsersProvider>()
            .searchUsersByName(_currentQuery);
      } else {
        _searchGroupsResults = await di
            .injector<model_groups_provider.GroupsProvider>()
            .searchGroupsByName(_currentQuery);
      }
    } catch (e, s) {
      developer.log('Search error', error: e, stackTrace: s);
      _searchPeopleResults = [];
      _searchGroupsResults = [];
    } finally {
      _isPeopleLoading = false;
      _isGroupsLoading = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    _currentQuery = '';
    _searchPeopleResults = [];
    _searchGroupsResults = [];
    _isPeopleLoading = false;
    _isGroupsLoading = false;
    notifyListeners();
  }

  Future<bool> hasPermissionToCreateGroups() async {
    final role =
        await di.injector<model_users_provider.UsersProvider>().whichUser();
    return role == UserRole.admin || role == UserRole.teacher;
  }
}
