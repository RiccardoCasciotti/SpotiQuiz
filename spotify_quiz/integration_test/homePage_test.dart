// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('HomePage Layout : Logout', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("LogoutHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : ProfilePic', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("ProfilePicHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : Username', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("UsernameHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : LevelText', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("LevelHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : LevelInfo', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("LevelHomeInfo")), findsOneWidget);
  });

  testWidgets('HomePage Layout : NOfQuizText', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("NOfQuizHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : NOfQuizInfo', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("NOfQuizHomeInfo")), findsOneWidget);
  });

  testWidgets('HomePage Layout : NavBar', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("NavBarHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : EventButton', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("EventButtonHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : EventText', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("EventTextHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : RankingText', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("RankingTextHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : RankingButton', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("RankingButtonHome")), findsOneWidget);
  });

  testWidgets('HomePage Layout : HomeButton', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('HomePage Layout : QuizButton', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder button = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(button);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byIcon(Icons.question_mark), findsOneWidget);
  });

  testWidgets('Clicking on HomeButton', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonHome = find.byIcon(Icons.home);

    await tester.tap(buttonHome);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("HomePage")), findsOneWidget);
  });

  testWidgets('Clicking on ProfilePic', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("ProfilePage")), findsOneWidget);
  });

  testWidgets('Clicking on QuizButton', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("QuizPage")), findsOneWidget);
  });

  testWidgets('Clicking on RankingButton', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("LocalRankingPage")), findsOneWidget);
  });

  testWidgets('Clicking on EventButton', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder eventRanking = find.byKey(const Key("EventButtonHome"));

    await tester.tap(eventRanking);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("EventPage")), findsOneWidget);
  });
}
