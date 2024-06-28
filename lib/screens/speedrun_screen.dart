import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:playwith_customer_app/components/notifications/in_app_notification_pop_up.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/screens/results_screen.dart';
import 'package:playwith_customer_app/storage_reader_writer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/page_keyboard.dart';
import '../components/question_skeleton.dart';
import '../components/sheet_music_components/note.dart';
import '../lessons_and_quizzes/question_brain.dart';
import '../lessons_and_quizzes/question_finder.dart';

/// Screen that displays and runs the speedrun mode.
///
/// The user's selection on the speedrun menu screen determines the time duration.
/// Once time is up a results screen is shown with the user's score, and records are updated if necessary.
class SpeedrunScreen extends StatefulWidget {
  /// The duration of the speedrun
  final int timerDuration;

  /// ID of the screen
  static const String id = 'speedrun_screen';

  const SpeedrunScreen({Key? key, required this.timerDuration}) : super(key: key);

  @override
  State<SpeedrunScreen> createState() => _SpeedrunScreenState();
}

/// The state for the speedrun screen.
class _SpeedrunScreenState extends State<SpeedrunScreen> {
  /// Manages the questions
  late QuestionBrain questionBrain;

  /// Displays the questions
  late Widget screenWidget;

  /// The object that will handle any Shared Preference interactions for this screen.
  StorageReaderWriter storage = StorageReaderWriter();

  @override
  void initState() {
    super.initState();

    /// Gets all of the questions in a random order.
    questionBrain = QuestionBrain(questions: QuestionFinder().getRandomListOfQuestions());
    _setScreenWidget();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// The widget to appear on screen.
  void _setScreenWidget() {
    Note note = questionBrain.getNote();
    Clef clef = questionBrain.getClef();
    String questionText = I18n.strings.whatNoteIsThis;
    int questionNum = questionBrain.getQuestionNum();
    int totalNumOfQuestions = questionBrain.getTotalNumberOfQuestions();

    screenWidget = QuestionSkeleton(
      note: note,
      clef: clef,
      questionText: questionText,
      questionNum: questionNum,
      totalNumOfQuestions: totalNumOfQuestions,
    );
  }

  /// The result values, as well as the text to pass into the results screen.
  Future<void> _getResults() async {
    // Calculates the percentage achieved by the user
    double percentage = 0;
    if (questionBrain.getQuestionNum() > 1) {
      // Exclude the last question since it is displayed immediately before the results screen is shown
      percentage = questionBrain.getScore() / (questionBrain.getQuestionNum() - 1);
    }
    String title = I18n.strings.correctAnswersInSeconds(questionBrain.getScore(), widget.timerDuration);

    int score = questionBrain.getScore();

    List displayNotification = await storage.displaySpeedrunNotification(widget.timerDuration, score);

    _getResultsScreen(title, percentage);

    if (displayNotification[0]) {
      inAppNotification(context, displayNotification[1]);
    }
  }

  /// The results screen.
  void _getResultsScreen(String title, double percentage) {
    // Stops the user from swiping back to the quiz
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

  ///Checks if the user's score is a new record for the selected mode, and updates shared preferences if it is.
  Future<void> _updateRecords() async {
    int score = questionBrain.getScore();
    final prefs = await SharedPreferences.getInstance();
    final int currentRecord =
        int.parse((prefs.get('${widget.timerDuration}_second_speedrun_record') ?? '0').toString());
    if (score > currentRecord) {
      await prefs.setInt('${widget.timerDuration}_second_speedrun_record', score);
    }
  }

  /// The countdown timer displayed in the top-right of the screen.
  Widget _getCountdownTimer() {
    return CircularCountDownTimer(
      width: heightAndWidthOfStopWatch,
      height: heightAndWidthOfStopWatch,
      duration: widget.timerDuration,
      // Makes the timer count backwards
      isReverse: true,
      backgroundColor: countdownTimerBackgroundColour,
      fillColor: countdownTimerFillColour,
      ringColor: countdownTimerRingColour,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: countdownTimerTextStyle,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {},
      onComplete: () {
        // When timer finishes, go to results screen and update records if needed
        _updateRecords();
        _getResults();
      },
    );
  }

  /// The key pressed on the keyboard by the user.
  void _getAnswer(String text) {
    questionBrain.setAnswer(userAnswer: text);
    setState(() {
      //if questions have run out, it automatically takes user to results screen
      if (questionBrain.isLastQuestion()) {
        _getResults();
      } else {
        questionBrain.goToNextQuestion();
        // Re-render the screen with new question
        _setScreenWidget();
      }
    });
  }

  /// Creates the screen.
  @override
  Widget build(BuildContext context) {
    return PWScaffold(
      body: SafeArea(
        // Timer is stacked on top of the question.
        child: Stack(
          children: [
            Column(
              children: [
                // Question
                screenWidget,
                Expanded(
                  child: PageKeyboard(_getAnswer),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: _getCountdownTimer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
