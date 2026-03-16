import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interview_task/app.dart';
import 'package:interview_task/home_page.dart';
import 'package:interview_task/l10n/app_localizations.dart';

void main() {
  testWidgets('HomePage displays text correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hello there'), findsOneWidget);
  });

  testWidgets('Tap changes background color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        home: const HomePage(),
      ),
    );

    final gesture = find.byType(GestureDetector);

    expect(gesture, findsOneWidget);

    await tester.tap(gesture);
    await tester.pump();
  });
}
