import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'sections/daily_missions.dart';
import 'sections/monthly_missions.dart';
import 'sections/weekly_missions.dart';
import 'widgets/section_row.dart';

class MissionsPage extends StatefulWidget {
  MissionsPage({Key? key}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  @override
  Widget build(BuildContext context) {
    return TabPage(
      children: <Widget>[
        SectionRow(),
        Container(
          height: 500,
          child: PageView(
            // controller: controller.controller,
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
    );
  }
}
