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

    //test
    expect(find.byKey(const Key("NavigationRail")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text GameC', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("TabletGameCText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button GameA', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("TabletGameA")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text GameA', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("TabletGameAText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button GameB', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("TabletGameB")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text GameB', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("TabletGameBText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button GameC', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("TabletGameC")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text GameD', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("TabletGameD")),
        find.byKey(const Key("TabletListGames")), const Offset(30.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGameDText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button GameD', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("TabletGameD")),
        find.byKey(const Key("TabletListGames")), const Offset(30.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGameD")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Text GameR', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("TabletGameR")),
        find.byKey(const Key("TabletListGames")), const Offset(50.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGameRText")), findsOneWidget);
  });

  testWidgets('Quiz Page Layout: Button GameR', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("TabletGameR")),
        find.byKey(const Key("TabletListGames")), const Offset(50.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletGameR")), findsOneWidget);
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

  testWidgets('Quiz Page Layout: Event Button', (WidgetTester tester) async {
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
    expect(find.byIcon(Icons.star_outline_sharp), findsOneWidget);
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

  testWidgets('Click Event Button', (WidgetTester tester) async {
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

    final Finder buttonEvent = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvent);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletEventPage")), findsOneWidget);
  });

  testWidgets('Click GameA', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameA"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("gameInfoPageA")), findsOneWidget);
  });

  testWidgets('Click GameB', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameB"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("gameInfoPageB")), findsOneWidget);
  });

  testWidgets('Click GameC', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameC"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("gameInfoPageC")), findsOneWidget);
  });
  testWidgets('Click GameD', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameD"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("gameInfoPageD")), findsOneWidget);
  });

  testWidgets('Click GameR', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    final Finder buttonHome = find.byIcon(Icons.question_mark_outlined);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 6));

    await tester.dragUntilVisible(find.byKey(const Key("TabletGameR")),
        find.byKey(const Key("TabletListGames")), const Offset(50.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame1 = find.byKey(const Key("TabletGameR"));

    await tester.tap(buttonGame1);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("gameInfoPageR")), findsOneWidget);
  });
}
