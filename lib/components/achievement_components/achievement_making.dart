import 'package:playwith_customer_app/components/achievement_components/achievement_card.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';

import '../../constants.dart';

/// This file reads the values from storage and makes the achievement cards which is used for both tabs

class AchievementMaker {
  final List<AchievementCard> _achieved = [];
  final List<AchievementCard> _inProgress = [];

  void makeLists(allValues) {
    List<AchievementCard> achieveObjects = _makeAchievements(allValues);

    //deciding where each card will go
    if (achieveObjects.isNotEmpty) {
      for (AchievementCard card in achieveObjects) {
        if (card.complete >= card.target) {
          _achieved.add(card);
        } else {
          _inProgress.add(card);
        }
      }
    }
  }

  List<AchievementCard> getAchieved() {
    return _achieved;
  }

  List<AchievementCard> getInProgress() {
    return _inProgress;
  }

  List<AchievementCard> _makeAchievements(achieveValues) {
    //lesson achievements
    List<AchievementCard> achievements = [
      AchievementCard(I18n.strings.complete1Lesson, 1, achieveValues['completedLessons']),
      AchievementCard(I18n.strings.complete5Lessons, 5, achieveValues['completedLessons']),
      AchievementCard(I18n.strings.completeAllLessons, numOfLessons, achieveValues['completedLessons']),

      //quiz achievements
      AchievementCard(I18n.strings.complete1Quiz, 1, achieveValues['completedQuizzes']),
      AchievementCard(I18n.strings.complete5Quizzes, 5, achieveValues['completedQuizzes']),
      AchievementCard(I18n.strings.completeAllQuizzes, numOfQuizzes, achieveValues['completedQuizzes']),

      //endless achievements
      AchievementCard(I18n.strings.endlessTrebleBeginner10, 10, achieveValues['endless-treble-beginner-high-score']),
      AchievementCard(
          I18n.strings.endlessTrebleIntermediate20, 20, achieveValues['endless-treble-intermediate-high-score']),
      AchievementCard(I18n.strings.endlessTrebleExpert30, 30, achieveValues['endless-treble-expert-high-score']),

      AchievementCard(I18n.strings.endlessBassBeginner10, 10, achieveValues['endless-bass-beginner-high-score']),
      AchievementCard(
          I18n.strings.endlessBassIntermediate20, 20, achieveValues['endless-bass-intermediate-high-score']),
      AchievementCard(I18n.strings.endlessBassExpert30, 30, achieveValues['endless-bass-expert-high-score']),

      //speedrun achievements
      AchievementCard(I18n.strings.speedrun10, 5, achieveValues['speedrun10HS']),
      AchievementCard(I18n.strings.speedrun20, 10, achieveValues['speedrun20HS']),
      AchievementCard(I18n.strings.speedrun30, 15, achieveValues['speedrun30HS']),
      AchievementCard(I18n.strings.speedrun40, 20, achieveValues['speedrun40HS']),
      AchievementCard(I18n.strings.speedrun50, 25, achieveValues['speedrun50HS']),
      AchievementCard(I18n.strings.speedrun60, 30, achieveValues['speedrun60HS']),

      //play along achievements
      AchievementCard(I18n.strings.odeToJoyBeginner, 100, achieveValues['ode to joy-beginner-high-score']),
      AchievementCard(I18n.strings.odeToJoyIntermediate, 100, achieveValues['ode to joy-intermediate-high-score']),
      AchievementCard(I18n.strings.odeToJoyExpert, 100, achieveValues['ode to joy-expert-high-score']),

      AchievementCard(
          I18n.strings.simpleBassMelodyBeginner, 100, achieveValues['a simple bass melody-beginner-high-score']),
      AchievementCard(I18n.strings.simpleBassMelodyIntermediate, 100,
          achieveValues['a simple bass melody-intermediate-high-score']),
      AchievementCard(
          I18n.strings.simpleBassMelodyExpert, 100, achieveValues['a simple bass melody-expert-high-score']),

      AchievementCard(I18n.strings.oldMacdonaldBeginner, 100, achieveValues['old macdonald-beginner-high-score']),
      AchievementCard(
          I18n.strings.oldMacdonaldIntermediate, 100, achieveValues['old macdonald-intermediate-high-score']),
      AchievementCard(I18n.strings.oldMacdonaldExpert, 100, achieveValues['old macdonald-expert-high-score']),

      AchievementCard(I18n.strings.fadedBeginner, 100, achieveValues['faded - alan walker-beginner-high-score']),
      AchievementCard(
          I18n.strings.fadedIntermediate, 100, achieveValues['faded - alan walker-intermediate-high-score']),
      AchievementCard(I18n.strings.fadedExpert, 100, achieveValues['faded - alan walker-expert-high-score']),

      AchievementCard(I18n.strings.swayingMelodyBeginner, 100, achieveValues['swaying melody-beginner-high-score']),
      AchievementCard(
          I18n.strings.swayingMelodyIntermediate, 100, achieveValues['swaying melody-intermediate-high-score']),
      AchievementCard(I18n.strings.swayingMelodyExpert, 100, achieveValues['swaying melody-expert-high-score']),
    ];
    return achievements;
  }
}
