// widget testing is wrong here ok

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnza/providers/auth_provider.dart';
import 'package:learnza/screen/auth/forgot_password_screen.dart';
import 'package:learnza/utils/theme.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@GenerateNiceMocks([MockSpec<AuthProvider>()])
import '../../provider/state/mock_auth_provider.mocks.dart';

void main() {
  setUpAll(() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      fail(details.exceptionAsString());
    };
  });
  // INFO: The test case i have written for the widget testing will not work with
  // widget test case.
  testWidgets('Forgot Password Screen renders correctly',
      (WidgetTester tester) async {
    final mockAuth = MockAuthProvider();

    // Create the widget using MultiProvider
    await tester.pumpWidget(MultiProvider(
      providers: [
        // Use Provider.value() but only for non-listenable dependencies
        ChangeNotifierProvider<AuthProvider>.value(value: mockAuth),
      ],
      child: ShadApp(
        theme: lightThemeData,
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const ForgotPasswordAuthScreen(),
      ),
    ));

    await tester.pumpAndSettle();
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await tester.tap(textField);
    await tester.pump();

    final textFieldWidget = tester.widget<TextField>(textField);
    expect(textFieldWidget.focusNode?.hasFocus ?? true, isTrue);

    expect(tester.takeException(), isNull);
  });
}
