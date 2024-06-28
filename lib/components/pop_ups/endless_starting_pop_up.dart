import 'package:flutter/material.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../sheet_music_components/note.dart';

/// A set of instructions to be run before starting the endless mode.
///
/// This is a pop-up that tells the user what to do.
class EndlessStartingInstructions extends PopUpContentBuilder {
  /// Context data passed into this class.
  final BuildContext context;

  /// The function that gets called when the start menu is done
  final Function(Clef) onStart;

  EndlessStartingInstructions({required this.context, required this.onStart});

  /// Sets up the start menu
  @override
  void buildMenu() {
    text = Column(
      children: [
        Text(I18n.strings.endlessMode, style: pauseMenuTextStyle),
        const SizedBox(height: 10.0),
        Text(I18n.strings.endlessModeDescription),
        const SizedBox(height: 10.0),
        Text(I18n.strings.changeDifficulty),
        const SizedBox(height: 40.0),
        Text(I18n.strings.selectTheClef, style: pauseMenuTextStyle),
      ],
    );

    options = [
      ElevatedButton(
        child: Text(I18n.strings.treble),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeStartMenu(Clef.treble);
        },
      ),
      ElevatedButton(
        child: Text(I18n.strings.bass),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeStartMenu(Clef.bass);
        },
      ),
    ];
  }

  /// Removes the start menu
  void removeStartMenu(Clef clef) {
    onStart(clef);
    removeMenu();
  }
}
