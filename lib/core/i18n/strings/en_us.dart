import 'package:playwith_customer_app/core/i18n/strings/translation.dart';

class EnUs implements Translation {
  // Failures
  @override
  String get unexpectedFailure => 'Unexpected Failure!';
  @override
  String get notHaveInternetConnectionFailure => 'Check your internet connection and try again!';
  @override
  String get invalidDataFailure => 'Invalid data!';
  @override
  String get notFoundFailure => 'Not found!';
  @override
  String get internalServerErrorFailure => 'Server error!';

  // Words
  String get _question => 'Question';
  String get _of => 'of';
  @override
  String get reload => 'Reload';
  @override
  String get exitCaps => 'Exit';
  // @override
  // String get completeCaps => 'Complete';
  // @override
  // String get lesson => 'lesson';
  // @override
  // String get lessons => 'lessons';
  // @override
  // String get quiz => 'quiz';
  // @override
  // String get quizzes => 'quizzes';

  // MenuScreen
  @override
  String get lessonsCaps => 'Lessons';
  @override
  String get practice => 'Practice';
  @override
  String get achievements => 'Achievements';
  @override
  String get learnMoreNotesNotification => 'Hey! Why don\'t you learn some more notes today?';

  // LessonMenuScreen
  @override
  String get lesson1 => 'Lesson 1';
  @override
  String get lesson2 => 'Lesson 2';
  @override
  String get lesson3 => 'Lesson 3';
  @override
  String get lesson4 => 'Lesson 4';
  @override
  String get lesson5 => 'Lesson 5';
  @override
  String get lesson6 => 'Lesson 6';
  @override
  String get lesson7 => 'Lesson 7';
  @override
  String get lesson8 => 'Lesson 8';
  @override
  String get lesson9 => 'Lesson 9';
  @override
  String get lesson10 => 'Lesson 10';

  // PracticeScreen
  @override
  String get practiceYourSkills => 'Practice your skills!';
  @override
  String get playAlong => 'Play along';
  @override
  String get speedrun => 'Speedrun';
  @override
  String get takeAQuiz => 'Take a Quiz';
  @override
  String get endless => 'Endless';

  // PlayAlongMenuScreen
  @override
  String get selectTrack => 'Select a track:';
  @override
  String get record => 'Record:';

  // SpeedrunMenuScreen
  @override
  String get chooseDuration => 'Choose a duration:';
  @override
  String get seconds => ' seconds';

  // QuizSelectionScreen
  @override
  String get chooseQuiz => 'Choose a quiz:';
  @override
  String get randomMixedQuiz => 'Random mixed quiz';
  @override
  String get quiz1 => 'Quiz 1 (Lesson 1)';
  @override
  String get quiz2 => 'Quiz 2 (Lesson 2)';
  @override
  String get quiz3 => 'Quiz 3 (Lesson 3)';
  @override
  String get quiz4 => 'Quiz 4 (Lesson 4)';
  @override
  String get quiz5 => 'Quiz 5 (Lesson 5)';
  @override
  String get quiz6 => 'Quiz 6 (Lesson 6)';
  @override
  String get quiz7 => 'Quiz 7 (Lesson 7)';
  @override
  String get quiz8 => 'Quiz 8 (Lesson 8)';
  @override
  String get quiz9 => 'Quiz 9 (Lesson 9)';
  @override
  String get quiz10 => 'Quiz 10 (Lesson 10)';

  // AchievementsScreen
  String get achievementsCaps => 'Achievements';
  @override
  String get toDoTab => 'To do';
  @override
  String get completedTab => 'Completed';

  // SettingsScreen
  @override
  String get settingsCaps => 'Settings';
  @override
  String get general => 'General';
  @override
  String get difficulty => 'Difficulty';
  @override
  String get theme => 'Theme';
  @override
  String get extras => 'Extras';
  @override
  String get resetProgress => 'Reset Progress';
  @override
  String get privacyPolicy => 'Privacy policy';
  @override
  String get warning => 'Warning';
  @override
  String get resetConfirmation => 'Resetting will delete all progress and settings.';
  @override
  String get cancel => 'Cancel';
  @override
  String get confirm => 'Confirm';
  @override
  String difficultyToString(String difficulty) {
    switch (difficulty) {
      case 'Beginner':
        return 'Beginner';
      case 'Intermediate':
        return 'Intermediate';
      case 'Expert':
        return 'Expert';
      default:
        return 'Beginner';
    }
  }

  @override
  String themeToString(String themeMode) {
    switch (themeMode) {
      case 'Dark':
        return 'Dark';
      case 'Light':
        return 'Light';
      case 'Pink':
        return 'Pink';
      default:
        return 'Dark';
    }
  }

  // // EndlessModeScreen
  // String get startGame => 'Start Game';
  // String get newHighScore => 'New High Score!';
  // String get stop => 'Stop';
  // String get endNotificationMessage =>
  //     'Resetting will delete all progress and settings.';

  // RandomQuizScreen
  @override
  String get awwBetterLuckNextTime => 'Aww, better luck next time!';
  @override
  String get congratulations => 'Congratulations!';
  @override
  String get quizzesCaps => 'Quizzes';

  // NoteHelperMenuScreen
  @override
  String get noteHelper => 'Note Helper';
  @override
  String get bassClefNotes => 'Bass Clef Notes';
  @override
  String get trebleClefNotes => 'Treble Clef Notes';
  @override
  String get noteTypes => 'Note Types';

  // AchievementsCompleted
  @override
  String get noAchievementsCompleted => 'No achievements have been completed yet';

  // EndlessEndingInstructions
  @override
  String get wellDone => 'Well Done!';
  @override
  String get yourScore => 'Your score:';
  @override
  String get highScore => 'High Score:';
  @override
  String get playGameAgain => 'Play Again';

  // EndlessStartingInstructions
  @override
  String get endlessMode => 'Endless Mode';
  @override
  String get endlessModeDescription => 'Get as many questions correct as you can before your lives run out!';
  @override
  String get changeDifficulty => 'Change the difficulty in settings to change the speed of notes.';
  @override
  String get selectTheClef => 'Select The Clef';
  @override
  String get treble => 'Treble';
  @override
  String get bass => 'Bass';

  // SpeedrunMenuInstructions
  @override
  String get speedrunMode => 'Speedrun Mode';
  @override
  String get speedrunModeDescription => 'Get as many questions correct as you can in the chosen duration!';
  @override
  String get goodLuck => 'Good luck!';

  // QuestionSkeleton
  @override
  String questionOfQuestions(int questionNum, int totalNumOfQuestions) {
    return '$_question $questionNum $_of $totalNumOfQuestions';
  }

  // ReviewAnswersScreen
  @override
  String questionOfUserAnswers(int questionNum, int totalNumOfUserAnswers) {
    return '$_question $questionNum $_of $totalNumOfUserAnswers';
  }

  // Quiz
  @override
  String get whatNoteIsThis => 'What note is this?';
  @override
  String get youGotCorrect => 'Correct!';
  @override
  String get youGotTheCorrectAnswer => 'You got the correct answer!';
  @override
  String get youGotIncorrect => 'Incorrect!';
  @override
  String get youGotWrongAnswer => 'Wrong answer, the correct answer is ';
  @override
  String get finish => 'Finish';
  @override
  String get next => 'Next';

  // ReviewAnswersScreen
  @override
  String get reviewAnswers => 'Review Answers';
  @override
  String get youDidNotAnswer => 'You did not answer any questions';
  @override
  String get correct => 'Correct';
  @override
  String get incorrect => 'Incorrect';
  @override
  String get correctAnswer => 'Correct Answer: ';
  @override
  String get yourAnswer => 'Your Answer: ';

  // inAppNotification
  @override
  String get achievementCompleted => 'Achievement completed!';
  @override
  String get continueToResults => 'Continue To Results';
  @override
  String get checkAchievements => 'Check Achievements';

  // StorageReaderWriter
  @override
  String get youCompletedOneLesson => 'You completed 1 lesson';
  @override
  String get youCompletedFiveLessons => 'You completed 5 lessons';
  @override
  String get youCompletedAllLessons => 'You completed all lessons';
  @override
  String get youCompletedOneQuiz => 'You completed 1 quiz';
  @override
  String get youCompletedFiveQuizzes => 'You completed 5 quizzes';
  @override
  String get youCompletedAllQuizzes => 'You completed all quizzes';
  @override
  String get youScoredFiftyPercentOrMore => 'You got 50% or more in this speedrun';
  @override
  String get youScoredTenOrMoreBeginner => 'You scored 10 or more in this endless mode';
  @override
  String get youScoredTwentyOrMoreIntermediate => 'You scored 20 or more in this endless mode';
  @override
  String get youScoredThirtyOrMoreExpert => 'You scored 30 or more in this endless mode';
  @override
  String get youGotHundredPercentPlayAlong => 'You got 100% in this play along! Good job!';
  @override
  String get betterLuckNextTime => 'Better luck next time!';

  // SpeedrunScreen
  @override
  String correctAnswersInSeconds(int score, int duration) {
    return '$score correct in $duration seconds';
  }

  // PlayAlongEndingInstructions
  @override
  String get songFinished => 'Song Finished';
  @override
  String get youGot => 'You got';
  @override
  String get playInstrumentAgain => 'Play Again';
  @override
  String get playAnotherSong => 'Play Another Song';
  @override
  String get exit => 'Exit';

  // Questions
  @override
  String get question1 =>
      'We are going to learn how to read notes. All music notes are on the lines or spaces of the musical stave. The far left symbol is called the Treble clef. This is our first note. The name is C (Do). The middle C is a circle with a short line across it. Press C on the keyboard.';
  @override
  String get question2 =>
      'This is our second note. The name is D (Re). It is directly under the lowest line. Now press D on the keyboard.';
  @override
  String get question3 =>
      'This is our third note. The name is E (Mi). The circle is on the lowest line of the 5 line stave. Now press E on the keyboard.';
  @override
  String get question4 =>
      'Great Job. Now you have learnt the first three notes. Try answering the rest of the questions without help. What note is this?';
  @override
  String get lesson2Introduction =>
      'This lesson will teach you 2 more notes. This note is F (Fa). It is between the 2 lowest lines of the stave. Now press F on the keyboard.';
  @override
  String get lesson2GNote =>
      'This note is G (Sol). The circle is on the second from lowest line of the stave. Now press G on the keyboard.';
  @override
  String get lesson2Practice => 'Try answer these questions on your own with a combination of the previous notes.';
  @override
  String get lesson3Introduction =>
      'This lesson will teach you the last 2 notes. This note is A (La). It is located below the middle line of the stave. Now press A on the keyboard.';
  @override
  String get lesson3BNote =>
      'This note is B (Ti). It is located at the middle line of the stave. Now press B on the keyboard.';
  @override
  String get lesson3Practice =>
      'Now you can read all the notes associated with the treble clef. Try answer these questions on your own with a combination of the previous notes.';
  @override
  String get lesson4Introduction =>
      'The clef symbol has changed! This is the Bass clef and notes are played on the lower part of the piano. The positions of the notes will be different. This is C on the Bass clef which is under the middle line. Now press C on the keyboard. ** Move the keyboard to the left before answering **.';
  @override
  String get lesson4DNote =>
      'This name is D (Re) on the Bass clef. It is on the middle line of the stave. Now press D on the keyboard.';
  @override
  String get lesson4ENote =>
      'This is E (Mi) on the Bass clef. It is between the second and third lines from top of the stave and is above D. Now press E on the keyboard.';
  @override
  String get lesson4FNote =>
      'This is F (Fa) on the Bass clef. It is one the second from top line of the stave. Now press F on the keyboard.';
  @override
  String get lesson4Practice =>
      'Great Job. Now you have learnt the first four notes on the Bass clef. Try answering the rest of the questions without help. What note is this?';
  @override
  String get lesson5Introduction =>
      '** This lesson is in bass clef, swipe the keyboard to the left first. ** Lets learn G A B on the Bass clef. This is position of G on the Bass clef which is below the top line of the stave. Now press G on the keyboard.';
  @override
  String get lesson5ANote =>
      'This name is A (La) on the Bass clef. This time A is a note crossed by the top line of the stave. Now press A on the keyboard.';
  @override
  String get lesson5BNote =>
      'This is B (Ti) on the Bass clef. It is on top of the first line from the stave. Now press B on the keyboard.';
  @override
  String get lesson5Practice =>
      'Great Job. Now you have learnt to read the basic notes on the Bass clef. Try answering the rest of the questions without help. What note is this?';
  @override
  String get lesson6Introduction =>
      'We are going to read higher notes on the Treble clef. The higher the note on on 5 line stave, the higher the pitch. Tap B for this note';
  @override
  String get lesson6CNote =>
      'Notice that this note is higher than B in the previous question. MOVE THE KEYBOARD TO THE RIGHT FOR HIGH PITCH and press C on the keyboard.';
  @override
  String get lesson6Practice =>
      'Great Job. All notes will repeat the pattern C-D-E-F-G-A-B before going back to C as you go higher up the musical stave. You will go further to the right when playing higher. What note is this?';
  @override
  String get lesson7Introduction =>
      'This is an extra lesson on how to lower notes. The lower the note on on 5 line stave, the lower the pitch. Tap C for this note';
  @override
  String get lesson7BNote =>
      'Notice that this note is lower than C in the previous question. MOVE THE KEYBOARD TO THE LEFT FOR LOW PITCH and press B on the keyboard.';
  @override
  String get lesson7Practice =>
      'Great Job. All notes will repeat the pattern C-B-A-G-F-E-D and goes back to C as you go down the musical stave or further to the left of a keyboard/piano. What note is this?';
  @override
  String get lesson8Introduction =>
      'This is an extra lesson on how to read sharps and flats. This # mark is a sharp. You have to press the closest key to the right (most of the time it is a black key). In this case, press the black key next to F on the right.';
  @override
  String get lesson8FlatNote =>
      'Great job, now learn about flats. The b-like mark is a flat. You have to press the closest key to the left. In this case, press the black key at the left of B';
  @override
  String get lesson8Practice =>
      'Great job, now try to answer this set of sharps and flats on your own. Press the keys the same way when you found a flat or a sharp on the bass clef.';
  @override
  String get lesson9Introduction =>
      'This is a wrap up lesson. We are reviewing notes on Treble clef and add some new notes for challenge. Remember you can swipe the keyboard left and right to change octave.';
  @override
  String get lesson10Introduction =>
      'This is a wrap up lesson. We are reviewing notes on bass clef and some new notes for challenge. Remember you can swipe the keyboard left and right to change octave. REMINDER TO SWIPE LEFT FIRST.';

  // AchievementMaker
  @override
  String get complete1Lesson => 'Complete 1 lesson';
  @override
  String get complete5Lessons => 'Complete 5 lessons';
  @override
  String get completeAllLessons => 'Complete all lessons';
  @override
  String get complete1Quiz => 'Complete 1 quiz';
  @override
  String get complete5Quizzes => 'Complete 5 quizzes';
  @override
  String get completeAllQuizzes => 'Complete all quizzes';
  @override
  String get endlessTrebleBeginner10 => 'Score 10 or higher on endless (treble in beginner difficulty)';
  @override
  String get endlessTrebleIntermediate20 => 'Score 20 or higher on endless (treble in intermediate difficulty)';
  @override
  String get endlessTrebleExpert30 => 'Score 30 or higher on endless (treble in expert difficulty)';
  @override
  String get endlessBassBeginner10 => 'Score 10 or higher on endless (bass in beginner difficulty)';
  @override
  String get endlessBassIntermediate20 => 'Score 20 or higher on endless (bass in intermediate difficulty)';
  @override
  String get endlessBassExpert30 => 'Score 30 or higher on endless (bass in expert difficulty)';
  @override
  String get speedrun10 => 'Score 5 or higher on the 10 second speedrun';
  @override
  String get speedrun20 => 'Score 10 or higher on the 20 second speedrun';
  @override
  String get speedrun30 => 'Score 15 or higher on the 30 second speedrun';
  @override
  String get speedrun40 => 'Score 20 or higher on the 40 second speedrun';
  @override
  String get speedrun50 => 'Score 25 or higher on the 50 second speedrun';
  @override
  String get speedrun60 => 'Score 30 or higher on the 60 second speedrun';
  @override
  String get odeToJoyBeginner => 'Complete Ode to Joy play along in beginner';
  @override
  String get odeToJoyIntermediate => 'Complete Ode to Joy play along in intermediate';
  @override
  String get odeToJoyExpert => 'Complete Ode to Joy play along in expert';
  @override
  String get simpleBassMelodyBeginner => 'Complete Simple bass melody play along in beginner';
  @override
  String get simpleBassMelodyIntermediate => 'Complete Simple bass melody play along in intermediate';
  @override
  String get simpleBassMelodyExpert => 'Complete Simple bass melody play along in expert';
  @override
  String get oldMacdonaldBeginner => 'Complete Old Macdonald play along in beginner';
  @override
  String get oldMacdonaldIntermediate => 'Complete Old Macdonald play along in intermediate';
  @override
  String get oldMacdonaldExpert => 'Complete Old Macdonald play along in expert';
  @override
  String get fadedBeginner => 'Complete Faded - Alan Walker play along in beginner';
  @override
  String get fadedIntermediate => 'Complete Faded - Alan Walker play along in intermediate';
  @override
  String get fadedExpert => 'Complete Faded - Alan Walker play along in expert';
  @override
  String get swayingMelodyBeginner => 'Complete Swaying Melody play along in beginner';
  @override
  String get swayingMelodyIntermediate => 'Complete Swaying Melody play along in intermediate';
  @override
  String get swayingMelodyExpert => 'Complete Swaying Melody play along in expert';
}
