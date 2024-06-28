import 'package:flutter/material.dart';
import 'package:playwith_customer_app/components/achievement_components/achievement_card.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import '../../constants.dart';

/// Achievements completed is the second tab which is shown
/// Simply displays the cards which were given to it

class AchievementsCompleted extends StatelessWidget {
  final List<AchievementCard> cards;
  const AchievementsCompleted({Key? key, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (cards.isEmpty)
        ? Center(
            child: Text(
              I18n.strings.noAchievementsCompleted,
              textAlign: TextAlign.center,
              style: achievementTextStyle,
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [for (AchievementCard card in cards) card],
            ),
          );
  }
}
