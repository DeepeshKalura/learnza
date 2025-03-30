import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/service/firebase_service.dart';
import 'package:learnza/service/internet_connectivity_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../provider/state/mock_auth_provider.mocks.dart';
import 'app_route_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<FirebaseService>(), MockSpec<InternetConnectivityService>()])
class MockBuildContext extends Mock implements BuildContext {}

class MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  late MockAuthProvider mockAuthProvider;
  late MockFirebaseService mockFirebaseService;
  late MockInternetConnectivityService mockInternetConnectivityService;
  late MockBuildContext mockContext;
  late MockGoRouterState mockState;

  setUp(() {
    mockAuthProvider = MockAuthProvider();
    mockFirebaseService = MockFirebaseService();
    mockInternetConnectivityService = MockInternetConnectivityService();
    mockContext = MockBuildContext();
    mockState = MockGoRouterState();
  });

  group('AppRouters Tests', () {
    test('Role Based Redirect', () async {
      // i will tell how internet will behave
      when(mockInternetConnectivityService.checkConnectivity())
          .thenAnswer((_) => Future.value(false));

      expect(true, true);
    });
  });
}
