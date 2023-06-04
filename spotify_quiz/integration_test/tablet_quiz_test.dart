import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Quiz Layout: Answer 1', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("AnswerQuestionHorizontal1")), findsOneWidget);
  });

  testWidgets('Quiz Layout: Answer 2', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("AnswerQuestionHorizontal2")), findsOneWidget);
  });

  testWidgets('Quiz Layout: Answer 3', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("AnswerQuestionHorizontal3")), findsOneWidget);
  });

  testWidgets('Quiz Layout: Answer 4', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("AnswerQuestionHorizontal4")), findsOneWidget);
  });

  testWidgets('Quiz Layout: Image Question', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ImageTablet")), findsOneWidget);
  });

  testWidgets('Click on Answer', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ResultScreenPageTablet")), findsOneWidget);
  });

  testWidgets('Result Layout: Result Text', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ResultText")), findsOneWidget);
  });

  testWidgets('Result Layout: Score Quiz', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ScoreQuiz")), findsOneWidget);
  });

  testWidgets('Result Layout: Score Quiz Info ', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ScoreQuizInfo")), findsOneWidget);
  });

  testWidgets('Result Layout: Return Button', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ReturnButton")), findsOneWidget);
  });

  testWidgets('Click Return', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder returnbutton = find.byKey(const Key("ReturnButton"));

    await tester.tap(returnbutton);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("gameInfoPageA")), findsOneWidget);
  });

  testWidgets('Result Layout: Continue Button', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ContinueButton")), findsOneWidget);
  });

  testWidgets('Click Continue', (WidgetTester tester) async {
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

    final Finder buttonGamePlay =
        find.byKey(const Key("TabletPlayButtonInfoPage"));

    await tester.tap(buttonGamePlay);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder answer = find.byKey(const Key("AnswerQuestionHorizontal1"));

    await tester.tap(answer);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder continuebutton = find.byKey(const Key("ContinueButton"));

    await tester.tap(continuebutton);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("QuizScreenPageTablet")), findsOneWidget);
  });
}
