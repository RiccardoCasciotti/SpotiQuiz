import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Check Login Page', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byKey(const Key("LoginButton")), findsOneWidget);
  });

  testWidgets('Login in the app', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("HomePage")), findsOneWidget);
  });
}
