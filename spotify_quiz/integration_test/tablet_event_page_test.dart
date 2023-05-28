import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Event Page Layout: NavigationRail', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("NavigationRail")), findsOneWidget);
  });

  testWidgets('Event Page Layout: NavigationRail', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("NavigationRail")), findsOneWidget);
  });

  testWidgets('Event Page Layout: Home Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
  });

  testWidgets('Clicking Home Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.home_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletHomePage")), findsOneWidget);
  });

  testWidgets('Event Page Layout: Quiz Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.question_mark_outlined), findsOneWidget);
  });

  testWidgets('Clicking Quiz Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonQuiz);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletQuizPage")), findsOneWidget);
  });

  testWidgets('Event Page Layout: Ranking Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.emoji_events_outlined), findsOneWidget);
  });

  testWidgets('Clicking Ranking Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byIcon(Icons.emoji_events_outlined);

    await tester.tap(buttonRanking);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletRankingPage")), findsOneWidget);
  });

  testWidgets('Event Page Layout: Event Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.star_sharp), findsOneWidget);
  });

  testWidgets('Clicking Event Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents2 = find.byIcon(Icons.star_sharp);

    await tester.tap(buttonEvents2);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletEventPage")), findsOneWidget);
  });

  testWidgets('Event Page Layout: Background Image',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("BackgroundImageEventTablet")), findsOneWidget);
  });

  testWidgets('Event Page Layout: Grid', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabEventPage")), findsOneWidget);
  });
}
