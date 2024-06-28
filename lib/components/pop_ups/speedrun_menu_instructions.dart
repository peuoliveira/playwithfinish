import 'package:flutter/material.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';

import '../../components/pop_up_components/pop_up_content_builder.dart';
import '../../constants.dart';

/// A set of instructions to be run before starting the speedrun mode.
///
/// This is a pop-up that tells the user what to do.
/// This is shown in the speedrun mode selection menu, as a (?) icon in the AppBar.
class SpeedrunMenuInstructions extends PopUpContentBuilder {
  final BuildContext context;

  SpeedrunMenuInstructions({required this.context});

  /// Sets up the instructions
  @override
  void buildMenu() {
    text = Column(children: [
      Text(I18n.strings.speedrunMode, style: pauseMenuTextStyle),
      const SizedBox(height: 20.0),
      Text(I18n.strings.speedrunModeDescription),
      const SizedBox(height: 20.0),
      Text(I18n.strings.goodLuck),
      const SizedBox(height: 30.0),
    ]);

    options = [
      ElevatedButton(
        child: Text(I18n.strings.exitCaps),
        style: pauseMenuButtonStyle,
        onPressed: () {
          removeMenu();
        },
      ),
    ];
  }
}
