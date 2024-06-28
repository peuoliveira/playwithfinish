import 'package:flutter/material.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/helper.dart';

import '../components/app_bar_with_settings_icon.dart';
import '../components/menu_button.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/pop_ups/play_along_instructions.dart';
import '../components/sheet_music_components/note.dart';
import '../play_along_tracks/bass_track_one.dart' as bass_track1;
import '../play_along_tracks/swaying_melody.dart' as bass_track2;
import '../play_along_tracks/track_faded.dart' as faded;
import '../play_along_tracks/treble_track_one.dart' as treble_track1;
import '../play_along_tracks/treble_track_two.dart' as treble_track2;
import '../storage_reader_writer.dart';
import 'play_along_screen.dart';

/// A list containing the keys for each of the buttons generated by build().
List<Key> trackButtonKeys = <Key>[];

/// A list containing the names of each of the play along tracks.
List<String> trackNames = <String>[
  'Ode to Joy',
  'A Simple Bass Melody',
  'Old Macdonald',
  'Faded - Alan Walker',
  'Swaying Melody',
];

///A list containing the user's records for each of the tracks.
///
/// It is set to some default values to prevent errors.
List<String> trackRecords = <String>[
  '0',
  '0',
  '0',
  '0',
  '0',
];

/// A list of all sheet music for each of the tracks
List<Map<int, Note>> trackSheets = <Map<int, Note>>[];

/// A list of all sheet sheets clefs for each of the tracks
List<Clef> trackClefs = <Clef>[];

/// A list of all sheet sheets speed for each difficulty for each of the tracks
List<List<int>> trackSpeeds = <List<int>>[];

///The class for the play along menu screen.
class PlayAlongMenuScreen extends StatefulWidget {
  ///The id used to identify the screen.
  static String id = 'play_along_menu_screen';

  const PlayAlongMenuScreen({Key? key}) : super(key: key);

  @override
  _PlayAlongMenuScreenState createState() => _PlayAlongMenuScreenState();
}

/// A screen containing a menu of the various tracks the user can play along to.
///
/// The tracks are shown as a List of clickable buttons.
/// There is also an AppBar containing the screen title, a back arrow and a setting icon, which when clicked takes you to the settings screen.
class _PlayAlongMenuScreenState extends State<PlayAlongMenuScreen> {
  /// The class used to handle any reading or writing to and from storage.
  final StorageReaderWriter _writer = StorageReaderWriter();
  final ScrollController _firstController = ScrollController();

  /// Loads the records for the play along tracks.
  void _loadRecords() {
    //Sets default values to use while the real records load.
    trackRecords = resetRecordListForMode('play along');
    _writer.loadDataFromStorage().then((value) => _updateRecords(_writer.read('difficulty').toString()));
    // Once the real records are loaded, the screen is refreshed with the new values.
    getRecordsForMode('play along').then((value) {
      setState(() {
        trackRecords = value;
      });
    });
  }

  /// Updates the play along records list.
  void _updateRecords(String difficulty) {
    _writer.write('difficulty', difficulty);
    //Sets default values to use while the real records load.
    trackRecords = [];
    for (String track in trackNames) {
      String key = '${track.toLowerCase()}-${difficulty.toString().toLowerCase()}-high-score';
      String record = _writer.read(key).toString();
      trackRecords.add(record);
    }
    setState(() {});
  }

  /// The ructor for the state class.
  _PlayAlongMenuScreenState() {
    _loadRecords();
  }

  /// Gets the bpm given a difficulty
  int _getSpeedFromDifficulty(List<int> bpm) {
    String difficulty = _writer.read('difficulty').toString();
    if (difficulty == 'Expert') {
      return bpm[2];
    } else if (difficulty == 'Intermediate') {
      return bpm[1];
    } else {
      return bpm[0];
    }
  }

  /// The music sheets to play along to for each track.
  List<Map<int, Note>> _getMusicSheets() {
    return <Map<int, Note>>[
      treble_track1.getTrack(),
      bass_track1.getTrack(),
      treble_track2.getTrack(),
      faded.getTrack(),
      bass_track2.getTrack(),
    ];
  }

  /// The clefs for each of the play along tracks.
  List<Clef> _getMusicSheetClefs() {
    return <Clef>[
      treble_track1.getClef(),
      bass_track1.getClef(),
      treble_track2.getClef(),
      faded.getClef(),
      bass_track2.getClef(),
    ];
  }

  /// The speeds at which each track will be played along to.
  List<List<int>> _getMusicSheetSpeeds() {
    return <List<int>>[
      treble_track1.getDifficultyBpm(),
      bass_track1.getDifficultyBpm(),
      treble_track2.getDifficultyBpm(),
      faded.getDifficultyBpm(),
      bass_track2.getDifficultyBpm(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    trackNames = trackNames;
    trackSheets = _getMusicSheets();
    trackClefs = _getMusicSheetClefs();
    trackSpeeds = _getMusicSheetSpeeds();

    trackButtonKeys = <Key>[]; //Resets the list of keys
    //Generates the keys for the track buttons based on track names.
    for (String track in trackNames) {
      trackButtonKeys.add(Key('trackSelected:$track'));
    }

    PopUpController menu = PopUpController(context: context, menuBuilder: PlayAlongInstructions(context: context));

    return PWScaffold(
      appBar: AppBarWithSettingsIcon(Text(I18n.strings.selectTrack), menu, onScreenDelete: _updateRecords),
      body: SafeArea(
        child: Scrollbar(
          controller: _firstController,
          // TODO(Peu):
// isAlwaysShown: true,
          child: ListView.separated(
              controller: _firstController,

              /// Uses an itemBuilder to generate a button for each track, using the names, records and keys generated earlier.
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100.0, //Fixes button height
                  child: MenuButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(trackNames[index], textAlign: TextAlign.left),
                        SizedBox(width: MediaQuery.of(context).size.width / 5), //Adds space between Text
                        Text('${I18n.strings.record} ${trackRecords[index]}%', textAlign: TextAlign.right),
                      ],
                    ),
                    onPress: () {
                      Map<int, Note> map = trackSheets[index];
                      Clef clef = trackClefs[index];
                      List<int> trackSpeed = trackSpeeds[0];
                      int bpm = _getSpeedFromDifficulty(trackSpeed);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayAlongScreen(
                                notes: map,
                                clef: clef,
                                difficulty: _writer.read('difficulty').toString(),
                                bpm: bpm,
                                songName: trackNames[index],
                                onBackToPlayAlongMenu: _loadRecords),
                          ));
                    },
                    key: trackButtonKeys[index],
                  ),
                );
              },
              //Adds blank spaces between each button.
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              itemCount: trackSheets.length),
        ),
      ),
    );
  }
}