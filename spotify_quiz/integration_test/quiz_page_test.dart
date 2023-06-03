import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() {
  utilities.runningTest = true;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('QuizPage Layout: First Quiz Button',
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

    //test
    expect(find.byKey(const Key("FirstQuizButton")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: First Quiz Text', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("FirstQuizText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Second Quiz Button',
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

    //test
    expect(find.byKey(const Key("SecondQuizButton")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Second Quiz Text', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("SecondQuizText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Third Quiz Button',
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

    //test
    expect(find.byKey(const Key("ThirdQuizButton")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Third Quiz Text', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("ThirdQuizText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Fourth Quiz Button',
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

    //test
    expect(find.byKey(const Key("ForthQuizButton")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Fourth Quiz Text', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("ForthQuizText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Fifth Quiz Button',
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

    //test
    expect(find.byKey(const Key("FifthQuizButton")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Fifth Quiz Text', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("FifthQuizText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Presentation Text',
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

    //test
    expect(find.byKey(const Key("PresentationText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Game List', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("GameList")), findsWidgets);
  });

  testWidgets('QuizPage Layout: Artist List', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("ArtistsList")), findsOneWidget);
  });

  testWidgets('QuizPage Layout: Artist Text', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("ArtistText")), findsOneWidget);
  });

  testWidgets('QuizPage Layout : NavBar', (WidgetTester tester) async {
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

    //test
    expect(find.byKey(const Key("NavBarHome")), findsOneWidget);
  });

  testWidgets('QuizPage Layout : QuizButton', (WidgetTester tester) async {
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

    //test
    expect(find.byIcon(Icons.question_mark), findsOneWidget);
  });

  testWidgets('QuizPage Layout : HomeButton', (WidgetTester tester) async {
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

    //test
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('Click Quiz Button Navbar', (WidgetTester tester) async {
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

    await tester.tap(buttonQuiz);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("QuizPage")), findsOneWidget);
  });

  testWidgets('Click Home Button Navbar', (WidgetTester tester) async {
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

    final Finder buttonHome = find.byIcon(Icons.home);

    await tester.tap(buttonHome);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("HomePage")), findsOneWidget);
  });

  testWidgets('Click First Game Button', (WidgetTester tester) async {
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
    expect(find.byKey(const Key("GameInfoPage")), findsOneWidget);
  });

  testWidgets('Click Second Game Button', (WidgetTester tester) async {
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

    final Finder buttonGame = find.byKey(const Key("SecondQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GameInfoPage")), findsOneWidget);
  });

  testWidgets('Click Third Game Button', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("ThirdQuizButton")),
        find.byKey(const Key("GameList")), const Offset(10.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("ThirdQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GameInfoPage")), findsOneWidget);
  });
  testWidgets('Click Fourth Game Button', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("ForthQuizButton")),
        find.byKey(const Key("GameList")), const Offset(20.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("ForthQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GameInfoPage")), findsOneWidget);
  });

  testWidgets('Click Fifth Game Button', (WidgetTester tester) async {
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

    await tester.dragUntilVisible(find.byKey(const Key("FifthQuizButton")),
        find.byKey(const Key("GameList")), const Offset(30.0, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGame = find.byKey(const Key("FifthQuizButton"));

    await tester.tap(buttonGame);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GameInfoPage")), findsOneWidget);
  });
}
