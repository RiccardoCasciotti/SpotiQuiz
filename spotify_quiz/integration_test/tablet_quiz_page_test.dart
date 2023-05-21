import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Quiz Page Layout: NavRail', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("NavigationRail")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text Game3', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGame3Text")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button Game1', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGame1")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text Game1', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGame1Text")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button Game2', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGame2")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text Game2', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGame2Text")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button Game3', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGame3")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Presentation Text',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletPresentationText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Game List', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletListGames")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Artist Text', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletArtistText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Artist List', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletArtistList")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Home Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Quiz Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.question_mark), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Ranking Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.emoji_events_outlined), findsOneWidget);
  });

  testWidgets('Click Quiz Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletQuizPage")), findsOneWidget);
  });

  testWidgets('Click Home Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome2 = find.byIcon(Icons.home_outlined);

    await tester.tap(buttonHome2);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletHomePage")), findsOneWidget);
  });

  testWidgets('Click Ranking Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byIcon(Icons.emoji_events_outlined);

    await tester.tap(buttonRanking);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletRankingPage")), findsOneWidget);
  });

  testWidgets('Click Game1', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame1 = find.byKey(const Key("TabletGame1"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TableGameInfoPage")), findsOneWidget);
  });

  testWidgets('Click Game2', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame2 = find.byKey(const Key("TabletGame2"));

    await tester.tap(buttonGame2);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TableGameInfoPage")), findsOneWidget);
  });

  testWidgets('Click Game3', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame3 = find.byKey(const Key("TabletGame3"));

    await tester.tap(buttonGame3);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TableGameInfoPage")), findsOneWidget);
  });
}
