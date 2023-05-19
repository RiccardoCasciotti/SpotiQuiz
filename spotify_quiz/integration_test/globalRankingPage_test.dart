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

  testWidgets('RankingPage Layout: NavBar', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("NavBarRanking")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: GoBackGlobalRanking',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GoBackButtonGlobalRanking")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: GlobalRankingText',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GlobalRankingText")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: TableGloablRanking',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("TableGlobalRanking")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: UsernameTextGlobalRanking',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("UsernameGlobalRanking")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: LevelTextGlobalRanking',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("LevelGlobalRanking")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: BestScoreTextGlobalRanking',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("BestScoreGlobalRanking")), findsOneWidget);
  });

  testWidgets('RankingPage Layout: LocalRankingButton',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.place), findsOneWidget);
  });

  testWidgets('RankingPage Layout: GlobalRankingButton',
      (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byIcon(Icons.public), findsOneWidget);
  });

  testWidgets('Go back to HomePage', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonBack = find.byIcon(Icons.arrow_back);

    await tester.tap(buttonBack);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("HomePage")), findsOneWidget);
  });

  testWidgets('Click on LocalRanking Button', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonLocalRanking = find.byIcon(Icons.place);

    await tester.tap(buttonLocalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("LocalRankingPage")), findsOneWidget);
  });

  testWidgets('Click on GlobalRanking Button', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final Finder buttonLogin = find.byKey(const Key('LoginButton'));

    //do

    await tester.tap(buttonLogin);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonRanking = find.byKey(const Key("RankingButtonHome"));

    await tester.tap(buttonRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder buttonGlobalRanking = find.byIcon(Icons.public);

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.tap(buttonGlobalRanking);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    //test
    expect(find.byKey(const Key("GlobalRankingPage")), findsOneWidget);
  });
}
