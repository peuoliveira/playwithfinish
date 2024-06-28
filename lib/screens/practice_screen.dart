import 'package:flutter/material.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';

import '../components/app_bar_with_settings_icon.dart';
import '../components/menu_button.dart';
import '../components/menu_button_text.dart';
import '../components/pop_up_components/pop_up_controller.dart';
import '../components/pop_ups/practice_menu_instructions.dart';
import 'endless_mode_screen.dart';
import 'play_along_menu_screen.dart';
import 'quiz_selection_screen.dart';
import 'speedrun_menu_screen.dart';

/// A screen containing various practice modes for the user to select.
///
/// The modes are: Play along, Speedrun, Quiz, Endless.
/// The user selects a mode by clicking the relevant button.
/// There is also an AppBar containing the screen title, a back arrow and a setting icon, which when clicked takes you to the settings screen.
class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  /// The id used to identify the screen
  static String id = 'practice_screen';

  static const navigateToSpeedrunMenuButtonKey = Key('navigateToSpeedrunMenu');
  static const navigateToPlayAlongMenuButtonKey = Key('navigateToPlayAlongMenu');
  static const navigateToQuizSelectionButtonKey = Key('navigateToQuizSelection');
  static const navigateToEndlessModeButtonKey = Key('navigateToEndlessMode');

  @override
  Widget build(BuildContext context) {
    PopUpController menu = PopUpController(context: context, menuBuilder: PracticeMenuInstructions(context: context));

    return PWScaffold(
      appBar: AppBarWithSettingsIcon(Text(I18n.strings.practiceYourSkills), menu),
      body: SafeArea(
        child: GridView.count(
          ///Makes the children all fit on the screen without the need for scrolling.
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height * (5 / 7)),

          ///Adds horizontal spacing between the buttons
          crossAxisSpacing: MediaQuery.of(context).size.height / 15,

          ///Adds vertical spacing between the buttons
          mainAxisSpacing: MediaQuery.of(context).size.height / 15,

          ///Adds padding for the buttons from the edges of the body area
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 15),
          crossAxisCount: 2,
          children: <Widget>[
            MenuButton(
              child: Center(child: MenuButtonText(buttonText: I18n.strings.playAlong)),
              onPress: () {
                Navigator.pushNamed(context, PlayAlongMenuScreen.id);
              },
              key: navigateToPlayAlongMenuButtonKey,
            ),
            MenuButton(
              child: Center(child: MenuButtonText(buttonText: I18n.strings.speedrun)),
              onPress: () {
                Navigator.pushNamed(context, SpeedrunMenuScreen.id);
              },
              key: navigateToSpeedrunMenuButtonKey,
            ),
            MenuButton(
              child: Center(child: MenuButtonText(buttonText: I18n.strings.takeAQuiz)),
              onPress: () {
                Navigator.pushNamed(context, QuizSelectionScreen.id); //Replace screen name
              },
              key: navigateToQuizSelectionButtonKey,
            ),
            MenuButton(
              child: Center(child: MenuButtonText(buttonText: I18n.strings.endless)),
              onPress: () {
                Navigator.pushNamed(context, EndlessModeScreen.id);
              },
              key: navigateToEndlessModeButtonKey,
            )
          ],
        ),
      ),
    );
  }
}
