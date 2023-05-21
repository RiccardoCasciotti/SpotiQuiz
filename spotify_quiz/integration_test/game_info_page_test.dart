import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Game Info Page Layout: PlayButton', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FirstQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("PlayButtonInfoPage")), findsOneWidget);
  });

  testWidgets('Game Info Page Layout: Text Information',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FirstQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TextInfoPage")), findsOneWidget);
  });

  testWidgets('Game Info Page Layout: Game Image', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FirstQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("BackGroundImage")), findsOneWidget);
  });

  testWidgets('Game Info Page Layout: Go Back Button Info Page',
      (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FirstQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GoBackButtonInfoPage")), findsOneWidget);
  });

  testWidgets('Return To Quiz Page', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FirstQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonBack = find.byIcon(Icons.arrow_back);

    await tester.tap(buttonBack);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("QuizPage")), findsOneWidget);
  });

  testWidgets('Click on Play', (WidgetTester tester) async {
    //setup
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuiz = find.byIcon(Icons.question_mark);

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FirstQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPlay = find.byKey(const Key("PlayButtonInfoPage"));

    await tester.tap(buttonPlay);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //test
    expect(find.byKey(const Key("QuizLogicPage")), findsOneWidget);
  });
}
