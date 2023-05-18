import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('failing test example', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle();

    //final Finder button = find.byIcon(Icons.add);

    //do
    //await tester.tap(button);
    //await Future.delayed(const Duration(seconds: 1));

    //await tester.pumpAndSettle();

    //test
    //expect(find.text('10'), findsOneWidget);

    expect(2 + 2, equals(4));
  });
}
