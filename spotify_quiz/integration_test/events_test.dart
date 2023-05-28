import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Events page: Background image', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    

    //login
    final Finder buttonLogin = find.byKey(const Key('LoginButton'));
    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    //


    final Finder buttonEvent = find.byKey(const Key("EventButtonHome"));
    await tester.tap(buttonEvent);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    //test
    expect(find.byKey(const Key("BackGroundImageEvent")), findsOneWidget);
  });
  testWidgets('Events page: Event Frame', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    

    //login
    final Finder buttonLogin = find.byKey(const Key('LoginButton'));
    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    //


    final Finder buttonEvent = find.byKey(const Key("EventButtonHome"));
    await tester.tap(buttonEvent);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    //test
    expect(find.byKey(const Key("eventFrame")), findsOneWidget);
  });
  testWidgets('Events page: List element', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    

    //login
    final Finder buttonLogin = find.byKey(const Key('LoginButton'));
    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    //


    final Finder buttonEvent = find.byKey(const Key("EventButtonHome"));
    await tester.tap(buttonEvent);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    //test
    expect(find.byKey(const Key("eventsList")), findsOneWidget);
  });

  testWidgets('Events page: Card Frame', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    

    //login
    final Finder buttonLogin = find.byKey(const Key('LoginButton'));
    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    //


    final Finder buttonEvent = find.byKey(const Key("EventButtonHome"));
    await tester.tap(buttonEvent);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    //test
    expect(find.byKey(const Key("CardFrame")), findsWidgets);
  });

  testWidgets('Events page: Card Image', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    

    //login
    final Finder buttonLogin = find.byKey(const Key('LoginButton'));
    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    //


    final Finder buttonEvent = find.byKey(const Key("EventButtonHome"));
    await tester.tap(buttonEvent);
    await tester.pumpAndSettle(const Duration(seconds: 15));

    //test
    expect(find.byKey(const Key("CardImage")), findsWidgets);
  });

}