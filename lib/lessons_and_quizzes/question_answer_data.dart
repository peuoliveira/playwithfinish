import 'package:playwith_customer_app/lessons_and_quizzes/questions_list.dart';
import 'package:playwith_customer_app/storage_reader_writer.dart';
import 'question.dart';
import 'package:playwith_customer_app/constants.dart';

/// A class that handles data related to questions and statistics about how they were answered.
class QuestionAnswerData {
  /// A map of questions and data about how many times the question was answered incorrectly.
  static final Map<int, int> _questionStatistics = {};

  /// An ordered list of question IDs.
  ///
  /// The first question ID is the ID of the question that was answered incorrectly the most number of times.
  static List<int> getPracticeQuestionIDs() {
    // Go through map values in ascending order
    // Add each corresponding ID to the return list

    // Converting map to List of List with inner list size 2 (Pairs)
    List<List<int>> statisticPairs = [];
    _questionStatistics.forEach((k, v) => statisticPairs.add([k, v]));

    // Sorting so first element is the question that was incorrect the most number of times
    statisticPairs.sort((p1, p2) => p1[1].compareTo(p2[1]));

    // Extracting the question IDs from most incorrect to correct
    List<int> questionIDs = [];
    for (List<int> pair in statisticPairs) {
      questionIDs.add(pair[0]);
    }

    return questionIDs;
  }

  /// Records when a question has been answered correctly/incorrectly.
  static void questionAnswered(int questionID, bool isCorrect, int? timeTaken) {
    int? currentStatistic = _questionStatistics[questionID];
    if (currentStatistic != null) {
      if (isCorrect) {
        // Update using combination of correct and time taken
        if (timeTaken != null) {
          // If answer correctly within threshold, get full marks
          if (timeTaken <= timeThreshold) {
            _questionStatistics[questionID] =
                currentStatistic += correctAnswerIncrease;
          } else {
            // Longer you take, more marks are reduced
            int reduction = (timeTaken ~/ 100) - correctAnswerIncrease;
            reduction =
                reduction <= maxTimeReduction ? reduction : maxTimeReduction;
            _questionStatistics[questionID] = currentStatistic -= reduction;
          }
        } else {
          _questionStatistics[questionID] =
              currentStatistic += correctAnswerIncrease;
        }
      } else {
        _questionStatistics[questionID] =
            currentStatistic -= incorrectAnswerReduction;
      }
      StorageReaderWriter().write(questionID.toString(), currentStatistic);
    }
  }

  /// Initialises values in map [_questionStatistics] when no saved data is available.
  static void createDefaultMap() {
    for (Question question in questions) {
      _questionStatistics[question.questionID] = 0;
    }
  }

  /// The statistics map.
  static Map<int, int> getQuestionStatisticsMap() {
    return _questionStatistics;
  }

  /// Updates the statistics map.
  static void updateQuestionStatisticsMap(int questionID, int value) {
    _questionStatistics[questionID] = value;
  }
}
