abstract class Translation {
  // Failures
  String get unexpectedFailure;
  String get notHaveInternetConnectionFailure;
  String get invalidDataFailure;
  String get notFoundFailure;
  String get internalServerErrorFailure;

  // Words
  String get reload;
  String get exitCaps;
  // String get completeCaps;
  // String get lesson;
  // String get lessons;
  // String get quiz;
  // String get quizzes;

  // MenuScreen
  String get lessonsCaps;
  String get practice;
  String get achievements;
  String get learnMoreNotesNotification;

  // LessonMenuScreen
  String get lesson1;
  String get lesson2;
  String get lesson3;
  String get lesson4;
  String get lesson5;
  String get lesson6;
  String get lesson7;
  String get lesson8;
  String get lesson9;
  String get lesson10;

  // PracticeScreen
  String get practiceYourSkills;
  String get playAlong;
  String get speedrun;
  String get takeAQuiz;
  String get endless;

  // PlayAlongMenuScreen
  String get selectTrack;
  String get record;

  // SpeedrunMenuScreen
  String get chooseDuration;
  String get seconds;

  // QuizSelectionScreen
  String get chooseQuiz;
  String get randomMixedQuiz;
  String get quiz1;
  String get quiz2;
  String get quiz3;
  String get quiz4;
  String get quiz5;
  String get quiz6;
  String get quiz7;
  String get quiz8;
  String get quiz9;
  String get quiz10;

  // AchievementsScreen
  String get toDoTab;
  String get completedTab;

  // SettingsScreen
  String get settingsCaps;
  String get general;
  String get difficulty;
  String get theme;
  String get extras;
  String get resetProgress;
  String get privacyPolicy;
  String get warning;
  String get resetConfirmation;
  String get cancel;
  String get confirm;
  String difficultyToString(String difficulty);
  String themeToString(String themeMode);

  // // EndlessModeScreen
  // String get startGame;
  // String get newHighScore;
  // String get stop;
  // String get endNotificationMessage;

  // RandomQuizScreen
  String get awwBetterLuckNextTime;
  String get congratulations;
  String get quizzesCaps;

  // NoteHelperMenuScreen
  String get noteHelper;
  String get bassClefNotes;
  String get trebleClefNotes;
  String get noteTypes;

  // AchievementsCompleted
  String get noAchievementsCompleted;

  // EndlessEndingInstructions
  String get wellDone;
  String get yourScore;
  String get highScore;
  String get playGameAgain;

  // EndlessStartingInstructions
  String get endlessMode;
  String get endlessModeDescription;
  String get changeDifficulty;
  String get selectTheClef;
  String get treble;
  String get bass;

  // SpeedrunMenuInstructions
  String get speedrunMode;
  String get speedrunModeDescription;
  String get goodLuck;

  // QuestionSkeleton
  String questionOfQuestions(int questionNum, int totalNumOfQuestions);

  // ReviewAnswersScreen
  String questionOfUserAnswers(int questionNum, int totalNumOfUserAnswers);

  // Quiz
  String get whatNoteIsThis;
  String get youGotCorrect;
  String get youGotTheCorrectAnswer;
  String get youGotIncorrect;
  String get youGotWrongAnswer;
  String get finish;
  String get next;

  // ReviewAnswersScreen
  String get reviewAnswers;
  String get youDidNotAnswer;
  String get correct;
  String get incorrect;
  String get correctAnswer;
  String get yourAnswer;

  // StorageReaderWriter
  String get youCompletedOneLesson;
  String get youCompletedFiveLessons;
  String get youCompletedAllLessons;
  String get youCompletedOneQuiz;
  String get youCompletedFiveQuizzes;
  String get youCompletedAllQuizzes;
  String get youScoredFiftyPercentOrMore;
  String get youScoredTenOrMoreBeginner;
  String get youScoredTwentyOrMoreIntermediate;
  String get youScoredThirtyOrMoreExpert;
  String get youGotHundredPercentPlayAlong;
  String get betterLuckNextTime;

  // inAppNotification
  String get achievementCompleted;
  String get continueToResults;
  String get checkAchievements;

  // SpeedrunScreen
  String correctAnswersInSeconds(int score, int duration);

  // PlayAlongEndingInstructions
  String get songFinished;
  String get youGot;
  String get playInstrumentAgain;
  String get playAnotherSong;
  String get exit;

  // Questions
  String get question1;
  String get question2;
  String get question3;
  String get question4;
  String get lesson2Introduction;
  String get lesson2GNote;
  String get lesson2Practice;
  String get lesson3Introduction;
  String get lesson3BNote;
  String get lesson3Practice;
  String get lesson4Introduction;
  String get lesson4DNote;
  String get lesson4ENote;
  String get lesson4FNote;
  String get lesson4Practice;
  String get lesson5Introduction;
  String get lesson5ANote;
  String get lesson5BNote;
  String get lesson5Practice;
  String get lesson6Introduction;
  String get lesson6CNote;
  String get lesson6Practice;
  String get lesson7Introduction;
  String get lesson7BNote;
  String get lesson7Practice;
  String get lesson8Introduction;
  String get lesson8FlatNote;
  String get lesson8Practice;
  String get lesson9Introduction;
  String get lesson10Introduction;

  // AchievementMaker
  String get complete1Lesson;
  String get complete5Lessons;
  String get completeAllLessons;
  String get complete1Quiz;
  String get complete5Quizzes;
  String get completeAllQuizzes;
  String get endlessTrebleBeginner10;
  String get endlessTrebleIntermediate20;
  String get endlessTrebleExpert30;
  String get endlessBassBeginner10;
  String get endlessBassIntermediate20;
  String get endlessBassExpert30;
  String get speedrun10;
  String get speedrun20;
  String get speedrun30;
  String get speedrun40;
  String get speedrun50;
  String get speedrun60;
  String get odeToJoyBeginner;
  String get odeToJoyIntermediate;
  String get odeToJoyExpert;
  String get simpleBassMelodyBeginner;
  String get simpleBassMelodyIntermediate;
  String get simpleBassMelodyExpert;
  String get oldMacdonaldBeginner;
  String get oldMacdonaldIntermediate;
  String get oldMacdonaldExpert;
  String get fadedBeginner;
  String get fadedIntermediate;
  String get fadedExpert;
  String get swayingMelodyBeginner;
  String get swayingMelodyIntermediate;
  String get swayingMelodyExpert;
}
