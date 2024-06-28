import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playwith_customer_app/components/page_keyboard.dart';
import 'package:playwith_customer_app/components/question_skeleton.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/main.dart';
import 'package:playwith_customer_app/screens/results_screen.dart';

void main() {
  Future<void> _goToRandomQuiz(WidgetTester tester) async {
    await tester.pumpWidget(const SightReadingApp());
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Take a Quiz'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Random mixed quiz'));
    await tester.pumpAndSettle();
  }

  testWidgets('Check that the keyboard is displayed', (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    expect(find.byType(PageKeyboard), findsOneWidget);
  });

  testWidgets('Check that the pause button is displayed', (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    expect(find.byIcon(Icons.pause), findsOneWidget);
  });

  testWidgets('Check that the first question is displayed', (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    expect(find.byType(QuestionSkeleton), findsOneWidget);
    expect(find.text(I18n.strings.questionOfQuestions(1, numOfQuestionsInPracticeQuiz)), findsOneWidget);
  });

  testWidgets('Check that the pop-up is displayed when a key is pressed', (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('Check that the pop-up displayed has a "Next" button to go to the next question',
      (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });

  testWidgets('Check that tapping the "Next" button goes to the next question', (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    expect(find.text(I18n.strings.questionOfQuestions(2, numOfQuestionsInPracticeQuiz)), findsOneWidget);
  });

  testWidgets('Check that the pop-up displayed has a "Finish" button when all questions have been answered',
      (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    for (int i = 0; i < numOfQuestionsInRandomQuiz - 1; ++i) {
      await tester.tap(find.text('C4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('C4'));
    await tester.pumpAndSettle();
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Finish'), findsOneWidget);
  });

  testWidgets('Check that the tapping the "Finish" button goes to the results screen', (WidgetTester tester) async {
    await _goToRandomQuiz(tester);
    for (int i = 0; i < numOfQuestionsInRandomQuiz; ++i) {
      await tester.tap(find.text('C4'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    }
    expect(find.byType(ResultsScreen), findsOneWidget);
  });
}
