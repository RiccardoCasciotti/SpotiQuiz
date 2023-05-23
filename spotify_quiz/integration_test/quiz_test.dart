import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('QuizScreen Layout: Image View', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("ImageSinger")), findsOneWidget);
  });

  testWidgets('QuizScreen Layout: Answer 1', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("AnswerQuestion1")), findsOneWidget);
  });

  testWidgets('QuizScreen Layout: Answer 2', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("AnswerQuestion2")), findsOneWidget);
  });

  testWidgets('QuizScreen Layout: Answer 3', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("AnswerQuestion3")), findsOneWidget);
  });

  testWidgets('QuizScreen Layout: Answer 4', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("AnswerQuestion4")), findsOneWidget);
  });

  testWidgets('Click on an answer', (WidgetTester tester) async {
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

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ResultScreenPage")), findsOneWidget);
  });

  testWidgets('Result Screen Layout: Result Text', (WidgetTester tester) async {
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

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ResultText")), findsOneWidget);
  });

  testWidgets('Result Screen Layout: Quiz Score', (WidgetTester tester) async {
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

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ScoreQuiz")), findsOneWidget);
  });

  testWidgets('Result Screen Layout: Quiz Score Info',
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

    final Finder buttonPlay = find.byKey(const Key("PlayButtonInfoPage"));

    await tester.tap(buttonPlay);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ScoreQuizInfo")), findsOneWidget);
  });

  testWidgets('Result Screen Layout: Return Button',
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

    final Finder buttonPlay = find.byKey(const Key("PlayButtonInfoPage"));

    await tester.tap(buttonPlay);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ReturnButton")), findsOneWidget);
  });

  testWidgets('Result Screen Layout: Continue Button',
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

    final Finder buttonPlay = find.byKey(const Key("PlayButtonInfoPage"));

    await tester.tap(buttonPlay);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ContinueButton")), findsOneWidget);
  });

  testWidgets('Press On Continue', (WidgetTester tester) async {
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

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonContinue = find.byKey(const Key("ContinueButton"));

    await tester.tap(buttonContinue);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("QuizLogicPage")), findsOneWidget);
  });

  testWidgets('Press On Quit', (WidgetTester tester) async {
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

    final Finder buttonAnswer = find.byKey(const Key("AnswerQuestion4"));

    await tester.tap(buttonAnswer);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonQuit = find.byKey(const Key("ReturnButton"));

    await tester.tap(buttonQuit);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GameInfoPage")), findsOneWidget);
  });
}
