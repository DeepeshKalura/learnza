import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../../interface/messenger_interface.dart';
import '../../../model/app_enums.dart';
import '../../../model/groups/groups_model.dart';
import '../../../model/users/users_model.dart';
import '../../model/groups_provider.dart';
import '../../model/messenger_provider.dart';
import '../../model/users_provider.dart';

class MessengerStateProvider extends ChangeNotifier {
  // Enum to manage search type

  // State variables
  SearchType _currentSearchType = SearchType.people;
  String _currentQuery = '';

  List<MessengerInterface> messengerInterface = [];

  // Search results
  List<UsersModel> _searchPeopleResults = [];
  List<GroupsModel> _searchGroupsResults = [];

  // Loading states
  bool _isPeopleLoading = false;
  bool _isGroupsLoading = false;

  // Getters
  SearchType get currentSearchType => _currentSearchType;
  List<UsersModel> get searchPeopleResults => _searchPeopleResults;
  List<GroupsModel> get searchGroupsResults => _searchGroupsResults;
  bool get isPeopleLoading => _isPeopleLoading;
  bool get isGroupsLoading => _isGroupsLoading;
  bool get isLoading => _isPeopleLoading || _isGroupsLoading;

  // Toggle search type
  void switchSearchType(SearchType type) {
    if (_currentSearchType != type) {
      _currentSearchType = type;
      // Perform search with current query when type changes
      if (_currentQuery.isNotEmpty) {
        performSearch(_currentQuery);
      }
      notifyListeners();
    }
  }

  // Perform search based on current type
  Future<void> performSearch(String query) async {
    // Reset current query
    _currentQuery = query;

    // Clear previous results if query is empty
    if (query.isEmpty) {
      _searchPeopleResults = [];
      _searchGroupsResults = [];
      _isPeopleLoading = false;
      _isGroupsLoading = false;
      notifyListeners();
      return;
    }

    try {
      // Set loading state based on current search type
      if (_currentSearchType == SearchType.people) {
        _isPeopleLoading = true;
        _isGroupsLoading = false;
      } else {
        _isPeopleLoading = false;
        _isGroupsLoading = true;
      }
      notifyListeners();

      // Perform search based on type
      if (_currentSearchType == SearchType.people) {
        _searchPeopleResults =
            await di.injector<UsersProvider>().searchUsersByName(query);
        _isPeopleLoading = false;
      } else {
        _searchGroupsResults =
            await di.injector<GroupsProvider>().searchGroupsByName(query);
        _isGroupsLoading = false;
      }

      notifyListeners();
    } catch (e, s) {
      // Error handling
      _searchPeopleResults = [];
      _searchGroupsResults = [];
      _isPeopleLoading = false;
      _isGroupsLoading = false;

      developer.log('Search error', error: e, stackTrace: s);
      notifyListeners();
    }
  }

  // Check group creation permissions
  Future<bool> hasPermissionToCreateGroups() async {
    final role = await di.injector<UsersProvider>().whichUser();
    return role == UserRole.admin || role == UserRole.teacher;
  }

  // Clear search results
  void clearSearch() {
    _currentQuery = '';
    _searchPeopleResults = [];
    _searchGroupsResults = [];
    _isPeopleLoading = false;
    _isGroupsLoading = false;
    notifyListeners();
  }

  Future<void> addPersonOrGroupToMessengerForUser(
      {String? userId, String? groupId}) async {
    if (userId == null && groupId == null) {
      throw Exception('Either userId or groupId must be provided');
    }

    await di.injector<MessengerProvider>().setUserMessengerModel(
          userId: userId,
          groupId: groupId,
        );
  }

  // First what stage this will happen

  bool listLoading = false;

  Future<void> retrieveUserMessengerList() async {
    listLoading = true;
    notifyListeners();
    try {
      messengerInterface =
          await di.injector<MessengerProvider>().getUserMessengerModel();
      developer.log(
        "Paroo $messengerInterface",
      );
    } catch (e) {
      developer.log('Error retrieving user messenger list', error: e);
      return;
    } finally {
      listLoading = false;
      notifyListeners();
    }
  }
}
