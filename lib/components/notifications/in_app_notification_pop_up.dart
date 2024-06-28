import 'package:flutter/material.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';

import '../../screens/achievements_screen.dart';

/// This is what is shown when a user completes an achievement
Future inAppNotification(BuildContext context, String text, {VoidCallback? onBack}) {
  return showModalBottomSheet(
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(60),
        topRight: Radius.circular(60),
      ),
    ),
    context: context,
    builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(I18n.strings.achievementCompleted, textAlign: TextAlign.center, style: title),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                // text of specific achievement completed is displayed
                Text(text, textAlign: TextAlign.center, style: achievedText),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onBack != null) {
                    onBack();
                  }
                },
                style: navButtonDeco,
                child: Text(I18n.strings.continueToResults),
              ),
              ElevatedButton(
                onPressed: () {
                  if (onBack != null) {
                    Navigator.pop(context);
                  }
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const AchievementsScreen();
                    }),
                  );
                },
                child: Text(I18n.strings.checkAchievements),
                style: navButtonDeco,
              )
            ],
          )
        ],
      );
    },
  );
}
