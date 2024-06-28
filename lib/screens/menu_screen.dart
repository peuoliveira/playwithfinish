// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:playwith_customer_app/components/app_name_box.dart';
import 'package:playwith_customer_app/components/menu_button.dart';
import 'package:playwith_customer_app/components/menu_button_text.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/core/services/auth_service.dart';
import 'package:playwith_customer_app/design_system/app_drawer.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';

import '../components/notifications/notification_service.dart';
import 'achievements_screen.dart';
import 'lesson_menu_screen.dart';
import 'note_helper_menu_screen.dart';
import 'practice_screen.dart';
import 'settings_screen.dart';

const navigateToPracticeMainMenuButtonKey = Key('navigateToPracticeMainMenu');

/// The main menu of the application.
///
/// The menu shows the title, as well as various buttons to access the features of the app:
/// "Lessons" - takes you to the lesson menu screen.
/// "Practice" - access various practice modes.
/// "Achievements" - see the various achievements you have obtained and have yet to obtained.
/// "Settings" - Adjust various settings, or reset your progress
/// "Helper" - See a guide to explain various notes.
class MenuScreen extends StatefulWidget {
  static String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

/// Main menu screen state
class _MenuScreenState extends State<MenuScreen> {
  // BannerAd? _bannerAd;
  // bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    // TODO(Peu):
    myBanner.load();
    NotificationAPI.init(initScheduled: true);
    NotificationAPI.showScheduledNotification(
      title: appName,
      body: I18n.strings.learnMoreNotesNotification,
      payload: 'extra info',
    );
    // _loadBannerAd();
  }

  // void _loadBannerAd() {
  //   _bannerAd = BannerAd(
  //     adUnitId: "ca-app-pub-9044800884563025/8636929888",
  //     size: AdSize.banner,
  //     request:  AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (Ad ad) {
  //         setState(() {
  //           _isAdLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );

  //   _bannerAd!.load();
  // }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    myBanner.dispose();
    super.dispose();
  }

  // TODO(Peu):
  final myBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-9044800884563025/8636929888",
      listener: const BannerAdListener(),
      request: const AdRequest());

  @override
  Widget build(BuildContext context) {
    final appLogoWidth = MediaQuery.of(context).size.width / 4;
    // TODO(Peu):
    final user = AuthService.getCurrentUser();

    return PWScaffold(
      key: drawerKey,
      // TODO(Peu):
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/piano_guy_x2.png',
                                width: appLogoWidth,
                              ),
                              const SizedBox(height: 16),
                              Image.asset(
                                'assets/images/logo.png',
                                width: appLogoWidth,
                              ),
                            ],
                          ),
                        ),
                        // // TODO(Peu):
                        // // if (_isAdLoaded && _bannerAd != null)
                        // //   Align(
                        // //     alignment: Alignment.bottomLeft,
                        // //     child: Container(
                        // //       alignment: Alignment.center,
                        // //       child: AdWidget(ad: _bannerAd!),
                        // //       width: _bannerAd!.size.width.toDouble(),
                        // //       height: _bannerAd!.size.height.toDouble(),
                        // //     ),
                        // //   ),
                        // Align(
                        //   alignment: Alignment.bottomLeft,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     child: AdWidget(ad: myBanner),
                        //     width: myBanner.size.width.toDouble(),
                        //     height: myBanner.size.height.toDouble(),
                        //   ),
                        // ),
                        // TODO(Peu):
                        if (user != null && isProd == false)
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: MenuButton(
                              child: const FaIcon(
                                FontAwesomeIcons.barsStaggered,
                                size: 24,
                                color: Colors.white,
                              ),
                              onPress: () {
                                drawerKey.currentState?.openDrawer();
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          // 'Lessons' button
                          child: MenuButton(
                            child: MenuButtonText(buttonText: I18n.strings.lessonsCaps),
                            onPress: () {
                              Navigator.pushNamed(context, LessonMenuScreen.id);
                            },
                          ),
                        ),
                        Expanded(
                          // 'Practice' button
                          child: MenuButton(
                            child: MenuButtonText(buttonText: I18n.strings.practice),
                            onPress: () {
                              Navigator.pushNamed(context, PracticeScreen.id);
                            },
                            key: navigateToPracticeMainMenuButtonKey,
                          ),
                        ),
                        Expanded(
                          // 'Achievements' button
                          child: MenuButton(
                            child: MenuButtonText(buttonText: I18n.strings.achievements),
                            onPress: () {
                              Navigator.pushNamed(context, AchievementsScreen.id);
                            },
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              //helper button
                              Expanded(
                                flex: 2,
                                child: MenuButton(
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: FaIcon(helperButton),
                                  ),
                                  onPress: () {
                                    Navigator.pushNamed(context, NoteHelperMenuScreen.id);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: MenuButton(
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: settingsIcon,
                                  ),
                                  onPress: () {
                                    Navigator.pushNamed(context, SettingsScreen.id);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
