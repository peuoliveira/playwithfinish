import 'package:flutter/material.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../constants.dart' as ants;
import '../storage_reader_writer.dart';
import '../theme_listener.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'settings_screen';
  final Function(String)? onBack;

  const SettingsScreen({Key? key, this.onBack}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

/// A screen that contain the various settings that can be changed by the user.
///
/// There is also the option to reset a user's progress on this screen.
class _SettingsScreenState extends State<SettingsScreen> {
  /// The object that will read and write the settings to storage.
  StorageReaderWriter settings = StorageReaderWriter();
  // TODO(Peu):
  // final Uri _url = Uri.parse(
  //     'https://readthatsheetprivacypolicy.blogspot.com/2022/07/read-that-sheet-privacy-policy.html');

  @override
  void initState() {
    super.initState();
    settings.loadDataFromStorage().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Confirms if the settings should be reset.
  _confirmReset(BuildContext context, ThemeNotifier themeNotifier) {
    ElevatedButton cancelButton = ElevatedButton(
      child: Text(I18n.strings.cancel),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    ElevatedButton resetButton = ElevatedButton(
      child: Text(I18n.strings.confirm),
      onPressed: () {
        setState(() => settings.reset());
        Navigator.of(context, rootNavigator: true).pop('dialog');
        themeNotifier.theme = ants.defaultTheme;
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(I18n.strings.warning),
      content: Text(I18n.strings.resetConfirmation),
      actions: [
        cancelButton,
        resetButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _launchUrl() async {
    // TODO(Peu):
    // if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, ThemeNotifier themeNotifier, child) {
      return PWScaffold(
        appBar: AppBar(
          title: Text(I18n.strings.settingsCaps),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
              if (widget.onBack != null) {
                widget.onBack!(settings.read('difficulty').toString());
              }
            },
          ),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: SettingsList(
                  sections: [
                    SettingsSection(
                      title: Text(I18n.strings.general),
                      tiles: <SettingsTile>[
                        /// Adjust difficulty
                        SettingsTile(
                          leading: const Icon(Icons.signal_cellular_alt_rounded),
                          title: Text(I18n.strings.difficulty),
                          value: DropdownButton(
                              value: settings.read('difficulty'),
                              key: const Key('difficulty selector'),
                              items: ants.difficultyList.map((option) {
                                return DropdownMenuItem(
                                  child: Text(I18n.strings.difficultyToString(option.toString())),
                                  value: option,
                                );
                              }).toList(),
                              onChanged: (level) {
                                if (level != null) {
                                  settings.write('difficulty', level).then((v) => setState(() => {}));
                                }
                              }),
                        ),

                        /// Adjust theme
                        SettingsTile(
                          title: Text(I18n.strings.theme),
                          leading: const Icon(Icons.format_paint),
                          key: const Key('theme selector'),
                          value: DropdownButton(
                            value: settings.read('theme'),
                            items: ants.themeColors.keys.toList().map((option) {
                              return DropdownMenuItem(
                                child: Text(I18n.strings.themeToString(option.toString())),
                                value: option,
                              );
                            }).toList(),
                            onChanged: (theme) {
                              if (theme != null) {
                                settings.write('theme', theme).then((v) => setState(() => {}));
                                themeNotifier.theme = theme.toString();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SettingsList(
                  sections: [
                    SettingsSection(
                      title: Text(I18n.strings.extras),
                      tiles: <SettingsTile>[
                        /// Reset progress
                        SettingsTile(
                          title: Center(
                            child: ElevatedButton(
                              child: Text(I18n.strings.resetProgress),
                              onPressed: () => _confirmReset(context, themeNotifier),
                            ),
                          ),
                        ),
                        SettingsTile(
                          title: Center(
                            child: ElevatedButton(
                                // TODO(Peu):
                                onPressed: _launchUrl,
                                child: Text(I18n.strings.privacyPolicy)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
