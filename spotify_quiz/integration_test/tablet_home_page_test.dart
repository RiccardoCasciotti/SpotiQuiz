import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('HomePage Layout: NavigationRail', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("NavigationRail")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Profile Pic', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletProfilePic")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Username', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletUsername")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Level', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletLevelHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Level Info', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletLevelInfoHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Number Of Quiz', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletNOfQuizHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Number Of Quiz Info',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletNOfQuizInfoHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Statistics text', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletStatisticTextHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Correct Answers Text',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletCorrectAnswerTextProfile")),
        findsOneWidget);
  });

  testWidgets('HomePage Layout: Correct Answers Text Info',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletCorrectAnswerInfoProfile")),
        findsOneWidget);
  });

  testWidgets('HomePage Layout: Wrong Answers Text',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(
        find.byKey(const Key("TabletWrongAnswerTextProfile")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Wrong Answers Info',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(
        find.byKey(const Key("TabletWrongAnswerInfoProfile")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Experience Text', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(
        find.byKey(const Key("TabletExperienceTextProfile")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Experience Info', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(
        find.byKey(const Key("TabletExperienceInfoProfile")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Best Score', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletBestScoreTextProfile")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Best Score Info', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletBestScoreInfoProfile")), findsOneWidget);
  });

  testWidgets('HomePage Layout: Home Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('HomePage Layout: Quiz Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.question_mark_outlined), findsOneWidget);
  });

  testWidgets('HomePage Layout: Ranking Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.emoji_events_outlined), findsOneWidget);
  });

  testWidgets('HomePage Layout: Event Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.star_outline_sharp), findsOneWidget);
  });

  testWidgets('HomePage Layout: Logout Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletLogoutHome")), findsOneWidget);
  });

  testWidgets('Logout', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonLogout = find.byIcon(Icons.logout_outlined);

    await tester.tap(buttonLogout);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("LoginButton")), findsOneWidget);
  });

  testWidgets('Click Home Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.home);

    await tester.tap(buttonHome);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletHomePage")), findsOneWidget);
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

    //test
    expect(find.byKey(const Key("TabletQuizPage")), findsOneWidget);
  });

  testWidgets('Click Ranking Button', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonHome = find.byIcon(Icons.emoji_events_outlined);

    await tester.tap(buttonHome);

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

    final Finder buttonEvents = find.byIcon(Icons.star_outline_sharp);

    await tester.tap(buttonEvents);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TabletEventPage")), findsOneWidget);
  });
}
