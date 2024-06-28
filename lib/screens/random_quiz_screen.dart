import 'package:flutter/material.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/lessons_and_quizzes/question_brain.dart';
import 'package:playwith_customer_app/lessons_and_quizzes/quiz.dart';
import 'package:playwith_customer_app/screens/quiz_selection_screen.dart';
import 'package:playwith_customer_app/screens/results_screen.dart';

import '../lessons_and_quizzes/question_finder.dart';

/// Creates screen for the random mixed quiz.
/// This screen consists of the option buttons and components in question_skeleton

class RandomQuizScreen extends StatefulWidget {
  static const String id = 'random_quiz_screen';

  const RandomQuizScreen({Key? key}) : super(key: key);

  @override
  _RandomQuizScreenState createState() => _RandomQuizScreenState();
}

class _RandomQuizScreenState extends State<RandomQuizScreen> {
  late QuestionBrain questionBrain;

  @override
  void initState() {
    super.initState();
    questionBrain =
        QuestionBrain(questions: QuestionFinder().getRandomListOfQuestions(numOfQuestions: numOfQuestionsInRandomQuiz));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getResultsScreen(String title, double percentage, QuestionBrain questionBrain) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          score: percentage,
          title: title,
          questionBrain: questionBrain,
        ),
      ),
    );
  }

  void _getResults() {
    String title = '';
    double percentage = questionBrain.getScore() / questionBrain.getTotalNumberOfQuestions();
    if (percentage < passThreshold) {
      title = I18n.strings.awwBetterLuckNextTime;
    } else {
      title = I18n.strings.congratulations;
    }
    _getResultsScreen(title, percentage, questionBrain);
  }

  @override
  Widget build(BuildContext context) {
    return Quiz(
      name: I18n.strings.quizzesCaps,
      id: QuizSelectionScreen.id,
      questionBrain: questionBrain,
      getResults: _getResults,
      useQuestionText: false,
    );
  }
}
