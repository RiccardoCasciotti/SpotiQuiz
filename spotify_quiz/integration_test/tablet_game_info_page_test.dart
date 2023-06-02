import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Game Info Page Layout: Go Back', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameA"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 4));

    //test
    expect(find.byKey(const Key("TabletGoBackInfoPage")), findsOneWidget);
  });

  testWidgets('Game Info Page Layout: Background Image',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameA"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(
        find.byKey(const Key("TabletBackgroundImageInfoPage")), findsOneWidget);
  });

  testWidgets('Game Info Page Layout: Text', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameA"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletInfoText")), findsOneWidget);
  });

  testWidgets('Game Info Page Layout: Play Button',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameA"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletPlayButtonInfoPage")), findsOneWidget);
  });

  // testWidgets('GoBack', (WidgetTester tester) async {
  //   //setup
  //   app.main();

  //   await tester.pumpAndSettle(const Duration(seconds: 5));

  //   final Finder button = find.byKey(const Key('LoginButton'));

  //   //do

  //   await tester.tap(button);

  //   await tester.pumpAndSettle(const Duration(seconds: 2));

  //   final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

  //   await tester.tap(buttonHome);

  //   await tester.pumpAndSettle(const Duration(seconds: 2));

  //   final Finder buttonGame1 = find.byKey(const Key("TabletGameA"));

  //   await tester.tap(buttonGame1);

  //   await tester.pumpAndSettle(const Duration(seconds: 2));

  //   final Finder buttonBack = find.byIcon(Icons.arrow_back);

  //   await tester.tap(buttonBack);
  //   await tester.pumpAndSettle(const Duration(seconds: 2));

  //   //test
  //   expect(find.byKey(const Key("TabletQuizPage")), findsOneWidget);
  // });

  //TODO
  //Quiz page interaction
}
