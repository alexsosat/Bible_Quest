import 'package:bible_quest/pages/mains/missions/sections/daily_missions.dart';
import 'package:bible_quest/pages/mains/missions/sections/monthly_missions.dart';
import 'package:bible_quest/pages/mains/missions/sections/weekly_missions.dart';
import 'package:bible_quest/pages/mains/missions/widgets/section_row.dart';
import 'package:flutter/material.dart';

class MissionsPage extends StatelessWidget {
  MissionsPage({Key? key}) : super(key: key);

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 130, bottom: 0),
      child: Column(
        children: <Widget>[
          SectionRow(controller: controller),
          Expanded(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ///Page 1
                DailyMissions(),

                ///Page 2
                WeeklyMissions(),

                ///Page 3
                MonthlyMissions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
