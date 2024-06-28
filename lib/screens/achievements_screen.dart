import 'package:flutter/material.dart';
import 'package:playwith_customer_app/components/achievement_components/achievement_making.dart';
import 'package:playwith_customer_app/components/achievement_components/achievements_completed.dart';
import 'package:playwith_customer_app/components/achievement_components/achievements_in_progress.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/storage_reader_writer.dart';

///  This screen is the main achievement screen which displays the different tabs

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const String id = 'achievements_screen';

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  //maker which will make all achievement cards
  AchievementMaker maker = AchievementMaker();
  StorageReaderWriter storage = StorageReaderWriter();
  //map to
  Map<String, int> _map = {};

  // when screen is initiated it gets values from storage

  @override
  void initState() {
    super.initState();
    _setPage();
  }

  //Loading values from storage on start
  void _setPage() async {
    Map<String, int> values = await storage.loadAchievementValues();

    //state changes when values are fetched
    setState(() {
      _map = values;
    });
    maker.makeLists(_map);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: PWScaffold(
        appBar: AppBar(
          title: Text(I18n.strings.achievements),
          bottom: TabBar(
            indicatorWeight: 1.0,
            indicatorPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white),
            ),
            tabs: [
              Tab(
                text: I18n.strings.toDoTab,
              ),
              Tab(
                text: I18n.strings.completedTab,
              ),
            ],
          ),
        ),
        // Tab bar which displays these two widgets, each tab bar receives its corresponding achievements
        body: TabBarView(children: [
          AchievementsInProgress(cards: maker.getInProgress()),
          AchievementsCompleted(cards: maker.getAchieved())
        ]),
      ),
    );
  }
}
