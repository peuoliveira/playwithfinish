import 'package:flutter/material.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/screens/lesson_screen.dart';
import 'package:playwith_customer_app/storage_reader_writer.dart';

import '../constants.dart';

/// This file creates the screen where the user can select the lesson
/// they want to learn from those available.

class LessonMenuScreen extends StatefulWidget {
  static const String id = 'lesson_menu_screen';

  const LessonMenuScreen({Key? key}) : super(key: key);

  @override
  _LessonMenuScreenState createState() => _LessonMenuScreenState();
}

class _LessonMenuScreenState extends State<LessonMenuScreen> {
  final ScrollController _firstController = ScrollController();
  StorageReaderWriter storage = StorageReaderWriter();

  final Map _map = {
    '1': false,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
    '8': false,
    '9': false,
    '10': false,
  };

  @override
  void initState() {
    super.initState();
    _setPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setPage() async {
    List<bool> values = await storage.loadLessonValues();
    //state changes when values are fetched
    setState(() {
      _map.addAll({
        '1': values[0],
        '2': values[1],
        '3': values[2],
        '4': values[3],
        '5': values[4],
        '6': values[5],
        '7': values[6],
        '8': values[7],
        '9': values[8],
        '10': values[9],
      });
    });
  }

  /// Builds the screen with the appBar and the row of lessons
  @override
  Widget build(BuildContext context) {
    //_setPage();
    return PWScaffold(
      appBar: AppBar(
        title: Text(I18n.strings.lessonsCaps),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _firstController,
          // TODO(Peu):
          // isAlwaysShown: true,
          child: SingleChildScrollView(
            /// makes the row scrollable
            scrollDirection: Axis.horizontal,
            controller: _firstController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _makeLessonButtons(),
            ),
          ),
        ),
      ),
    );
  }

  /// creates the individual lesson buttons for each lesson
  Widget _lessonButton(lessonText, lessonNum) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LessonScreen(lessonNum: lessonNum);
            }),
          );
        },
        child: Container(
          child: Center(
            child: FittedBox(
              child: Text(
                lessonText,
                style: pauseMenuTextStyle,
              ),
            ),
          ),
          decoration: _map[lessonNum.toString()] ? completeLessonButtonDeco : lessonButtonDeco,
          padding: const EdgeInsets.all(23),
          margin: const EdgeInsetsDirectional.all(7),
        ),
      ),
    );
  }

  List<Widget> _makeLessonButtons() {
    return [
      _lessonButton(I18n.strings.lesson1, 1),
      _lessonButton(I18n.strings.lesson2, 2),
      _lessonButton(I18n.strings.lesson3, 3),
      _lessonButton(I18n.strings.lesson4, 4),
      _lessonButton(I18n.strings.lesson5, 5),
      _lessonButton(I18n.strings.lesson6, 6),
      _lessonButton(I18n.strings.lesson7, 7),
      _lessonButton(I18n.strings.lesson8, 8),
      _lessonButton(I18n.strings.lesson9, 9),
      _lessonButton(I18n.strings.lesson10, 10),
    ];
  }
}
