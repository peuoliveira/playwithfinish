import 'package:flutter/material.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/screens/practice_quiz_screen.dart';
import 'package:playwith_customer_app/screens/random_quiz_screen.dart';

import '../components/app_bar_with_settings_icon.dart';
import '../components/menu_button.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/pop_ups/quiz_instructions.dart';
import '../helper.dart';
//For MenuButton widget

/// A list containing the names of each quiz, apart from the "random mixed quiz" which has no record.
List<String> quizzes = <String>[
  I18n.strings.quiz1,
  I18n.strings.quiz2,
  I18n.strings.quiz3,
  I18n.strings.quiz4,
  I18n.strings.quiz5,
  I18n.strings.quiz6,
  I18n.strings.quiz7,
  I18n.strings.quiz8,
  I18n.strings.quiz9,
  I18n.strings.quiz10,
];

/// A list containing the keys for each of the buttons generated by build().
List<Key> quizButtonKeys = <Key>[];

/// A list containing the user's records for each of the quizzes.
List<String> quizRecords = <String>[];

///The key for the button that confirms the selection of a random quiz.
const randomQuizSelectedKey = Key('quizSelected:Random');

///The state class for the quiz selection screen.
class QuizSelectionScreen extends StatefulWidget {
  ///The id used to identify the screen.
  static const String id = 'quiz_selection_screen';

  const QuizSelectionScreen({Key? key}) : super(key: key);

  @override
  _QuizSelectionScreenState createState() => _QuizSelectionScreenState();
}

/// A screen that displays a scrollable list of available quizzes with buttons to access each quiz.
///
/// An app bar is present at the top of the screen, which contains the screen's title text, a back arrow and a clickable settings icon that takes you to the settings screen.
/// There is also a button at the bottom of the screen for a "random mixed quiz".
class _QuizSelectionScreenState extends State<QuizSelectionScreen> {
  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    _loadRecords();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Loads the records for the quizzes.
  void _loadRecords() async {
    //Sets default values to use while the real records load.
    quizRecords = resetRecordListForMode('quiz');
    // Once the real records are loaded, the screen is refreshed with the new values.
    getRecordsForMode('quiz').then((value) {
      setState(() {
        quizRecords = value;
      });
    });
  }

  ///Builds the screen widgets.
  @override
  Widget build(BuildContext context) {
    quizButtonKeys = <Key>[]; //Resets list of keys
    ///Generates the keys for the quiz buttons based on quiz names, with the exception of the random mixed quiz.
    for (String quiz in quizzes) {
      quizButtonKeys.add(Key('quizSelected:$quiz'));
    }
    return _getScreenWidget();
  }

  /// The widget to be displayed on screen.
  Widget _getScreenWidget() {
    /// A pop-up instruction screen for the quizzes.
    PopUpController menu = PopUpController(context: context, menuBuilder: QuizInstructions(context: context));

    return PWScaffold(
      appBar: AppBarWithSettingsIcon(Text(I18n.strings.chooseQuiz), menu),
      body: SafeArea(
        child: Scrollbar(
          controller: _firstController,
          // TODO(Peu):
          // isAlwaysShown: true,
          child: Column(
            children: <Widget>[
              Expanded(
                /// Uses an itemBuilder to generate a button for each quiz, using the names, records and keys generated earlier.
                child: Scrollbar(
                  controller: _firstController,
                  // TODO(Peu):
// isAlwaysShown: true,
                  child: ListView.separated(
                    controller: _firstController,
                    padding: const EdgeInsets.all(8),
                    itemCount: quizzes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 100.0,
                        child: MenuButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(quizzes[index], textAlign: TextAlign.left),
                              SizedBox(width: MediaQuery.of(context).size.width / 4), //Adds space between Text
                              Text('${I18n.strings.record} ${quizRecords[index]} / $numOfQuestionsInPracticeQuiz',
                                  textAlign: TextAlign.right),
                            ],
                          ),
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PracticeQuizScreen(lessonID: index + 1)),
                            );
                          },
                          key: quizButtonKeys[index],
                        ),
                      );
                    },
                    //Adds blank spaces between each button
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                ),
              ),
              //Adds the random mixed quiz button to the bottom of the screen.
              //As this is not part of the ListView, it is not moved by scrolling.
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 80.0,
                    child: MenuButton(
                      child: Center(child: Text(I18n.strings.randomMixedQuiz)),
                      onPress: () {
                        Navigator.pushNamed(context, RandomQuizScreen.id);
                      },
                      key: randomQuizSelectedKey,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
