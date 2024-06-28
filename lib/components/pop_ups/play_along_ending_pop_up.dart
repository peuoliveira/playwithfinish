import 'package:flutter/material.dart';
import 'package:playwith_customer_app/components/play_along_components/play_along_hit_counter.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';
import '../../screens/menu_screen.dart';
import '../../screens/play_along_menu_screen.dart';

/// A set of instructions to be executed when the play along mode instance ends.
///
/// An instance is 'finished' once the last note in the track is played.
/// This is a play along specific pop-up results screen.
class PlayAlongEndingInstructions extends PopUpContentBuilder {
  /// Context data to pass into this class.
  final BuildContext context;

  /// Plays the song again
  final VoidCallback restart;

  /// Counts whether the notes where hit or missed
  final PlayAlongHitCounter hitCounter;

  /// A callback that takes you to the play along meu screen.
  final VoidCallback onBack;

  PlayAlongEndingInstructions(
      {required this.context, required this.hitCounter, required this.restart, required this.onBack});

  /// Sets up the end menu
  @override
  void buildMenu() {
    String percentage = hitCounter.getScoreAsPercentage();
    if (percentage[percentage.length - 1] == '0') {
      percentage = double.parse(percentage).round().toString();
    }
    text = Column(children: [
      Text(I18n.strings.songFinished, style: pauseMenuTextStyle),
      const SizedBox(height: 10.0),
      // TODO(Peu): put it into a function
      Text('${I18n.strings.youGot}: $percentage%', style: pauseMenuTextStyle),
      const SizedBox(height: 20.0),
    ]);

    options = [
      ElevatedButton(
        child: Text(I18n.strings.playInstrumentAgain),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
          restart();
        },
      ),
      ElevatedButton(
        child: Text(I18n.strings.playAnotherSong),
        style: pauseMenuButtonStyle,
        onPressed: () {
          onBack();
          Navigator.popUntil(context, ModalRoute.withName(PlayAlongMenuScreen.id));
        },
      ),
      ElevatedButton(
        child: Text(I18n.strings.exit),
        style: pauseMenuButtonStyle,
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(MenuScreen.id));
        },
      ),
    ];
  }
}
