import 'package:playwith_customer_app/screens/speedrun_menu_screen.dart';
import 'package:playwith_customer_app/screens/quiz_selection_screen.dart';
import 'package:playwith_customer_app/screens/play_along_menu_screen.dart';
import 'package:playwith_customer_app/storage_reader_writer.dart';

/// This file contains a series of helper functions used in various parts of the code.

/// Replaces all blank spaces from all strings with underscores in a list.
///
/// '''
/// replaceSpacesWithUnderscoresFromStrings(['Hello world', 'read that sheet']) == ['Hello_world', 'read_that_sheet']
/// '''
List<String> replaceSpacesWithUnderscoresFromStrings(List<String> toConvert) {
  List<String> stringsWithNoSpaces = <String>[];
  for (String string in toConvert) {
    String stringWithNoSpaces = '';
    for (var rune in string.runes) {
      String char = String.fromCharCode(rune);
      if (char != ' ') {
        stringWithNoSpaces = stringWithNoSpaces + char;
      } else {
        stringWithNoSpaces = stringWithNoSpaces + '_';
      }
    }
    stringsWithNoSpaces.add(stringWithNoSpaces);
  }
  return stringsWithNoSpaces;
}

/// The shared preference keys for the inputted mode.
///
/// The available modes are:
/// - 'speedrun'
/// - 'quiz'
/// - 'play along'
///
/// All other inputs return the empty list.
List<String> getRecordKeysForMode(String mode) {
  // Identifies which keys need to be obtained.
  List<String> keyList = [];
  if (mode == 'speedrun') {
    for (int category in modes) {
      keyList.add('${category}_second_speedrun_record');
    }
  } else if (mode == 'quiz') {
    List<String> tempKeyList = replaceSpacesWithUnderscoresFromStrings(quizzes);
    for (String key in tempKeyList) {
      keyList.add('${key}_record');
    }
  } else if (mode == 'play along') {
    StorageReaderWriter _writer = StorageReaderWriter();
    _writer.loadDataFromStorage().then((value) {
      for (String track in trackNames) {
        keyList.add(
            '${track.toLowerCase()}-${_writer.read('difficulty').toString().toLowerCase()}-high-score');
      }
    });
  }
  return keyList;
}

/// The records for each category of the inputted mode.
///
/// The available modes are:
/// - 'speedrun'
/// - 'quiz'
/// - 'play along'
///
/// All other inputs return the empty list.
Future<List<String>> getRecordsForMode(String mode) async {
  List<String> keyList = getRecordKeysForMode(mode);
  final StorageReaderWriter _reader = StorageReaderWriter();
  List<String> records = [];
  await _reader.loadDataFromStorage();
  for (String key in keyList) {
    records.add(_reader.read(key).toString());
  }
  return records;
}

/// Resets the record lists for the specified mode to reflect default values.
///
/// These lists are used for UI purposes - to set defaults in storage see StorageReaderWriter methods.
///
/// The available mode inputs are:
/// - 'speedrun'
/// - 'quiz'
/// - 'play along'
///
/// All other inputs do nothing.
List<String> resetRecordListForMode(String mode) {
  List<Object> categoryList = [];
  if (mode == 'speedrun') {
    modeRecords = [];
    categoryList = modes;
  } else if (mode == 'play along') {
    trackRecords = [];
    categoryList = trackNames;
  } else if (mode == 'quiz') {
    quizRecords = [];
    categoryList = quizzes;
  }
  List<String> defaultList = [];
  for (int i = 0; i < categoryList.length; i++) {
    defaultList.add('0');
  }
  return defaultList;
}

/// A variant of getRecords which returns void.
///
/// Used for certain parts of the code where you need a function with a void return type and no parameters.
void loadRecordsForPlayAlongMode() {
  getRecordsForMode('play along');
}
