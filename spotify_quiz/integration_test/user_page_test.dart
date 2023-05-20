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

  testWidgets('UserPage Layout : GoBackButton', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GoBackProfilePage")), findsOneWidget);
  });

  testWidgets('UserPage Layout : ProfilePic', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ProfilePicProfilePage")), findsOneWidget);
  });

  testWidgets('UserPage Layout : Statistics Text', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("StatisticsText")), findsOneWidget);
  });

  testWidgets('UserPage Layout : Correct Answers Text',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("CorrectAnswerTextProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : Correct Answers Info',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("CorrectAnswerInfoProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : Wrong Answers Text',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("WrongAnswerTextProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : Wrong Answers Text',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("WrongAnswerTextProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : Wrong Answers Info',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("WrongAnswerInfoProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : User Experience Text',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ExperienceTextProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : User Experience Info',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("ExperienceInfoProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : User BestScore Text',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("BestScoreTextProfile")), findsOneWidget);
  });

  testWidgets('UserPage Layout : User BestScore Info',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("BestScoreInfoProfile")), findsOneWidget);
  });

  testWidgets('Go back to HomePage', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonBack = find.byIcon(Icons.arrow_back);

    await tester.tap(buttonBack);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("HomePage")), findsOneWidget);
  });

  testWidgets('Click On Profile Pic', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPic = find.byKey(const Key("ProfilePicHome"));

    await tester.tap(buttonPic);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonPicProfilePage =
        find.byKey(const Key("ProfilePicProfilePage"));

    await tester.tap(buttonPicProfilePage);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GoBackProfilePage")), findsOneWidget);
  });
}
