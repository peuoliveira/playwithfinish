import 'package:flutter/material.dart';
import 'package:playwith_customer_app/components/menu_button.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/screens/note_helper_screen.dart';

import '../components/menu_button_text.dart';

///This screen is the note_helper selection screen which contain buttons.
class NoteHelperMenuScreen extends StatefulWidget {
  static String id = 'note_helper_menu_screen';
  const NoteHelperMenuScreen({Key? key}) : super(key: key);

  @override
  _NoteHelperMenuScreenState createState() => _NoteHelperMenuScreenState();
}

class _NoteHelperMenuScreenState extends State<NoteHelperMenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Builds the screen with appBar and note_helper buttons.
  @override
  Widget build(BuildContext context) {
    return PWScaffold(
      appBar: AppBar(
        title: Text(I18n.strings.noteHelper),
      ),
      body: SafeArea(
        child: GridView.count(
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height * (5 / 7)),
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          children: <Widget>[
            _bassClefNoteHelperbutton(),
            _trebleClefNoteHelperbutton(),
            _noteTypesHelperButton(),
          ],
        ),
      ),
    );
  }

  ///A button that will be route to specific screen of bass note_helper.
  Widget _bassClefNoteHelperbutton() {
    return MenuButton(
      child: MenuButtonText(buttonText: I18n.strings.bassClefNotes),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NoteHelperScreen(
              helperNum: 1,
            );
          }),
        );
      },
    );
  }

  ///A button that will be route to specific screen of clef note_helper.
  Widget _trebleClefNoteHelperbutton() {
    return MenuButton(
      child: MenuButtonText(buttonText: I18n.strings.trebleClefNotes),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NoteHelperScreen(
              helperNum: 2,
            );
          }),
        );
      },
    );
  }

  /// A button that will be routed to a specific screen of the note types note_helper.
  Widget _noteTypesHelperButton() {
    return MenuButton(
      child: MenuButtonText(buttonText: I18n.strings.noteTypes),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NoteHelperScreen(
              helperNum: 3,
            );
          }),
        );
      },
    );
  }
}
