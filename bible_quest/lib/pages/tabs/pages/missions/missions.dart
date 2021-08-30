import 'package:bible_quest/bloc/user/missions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 130, bottom: 0),
      child: GetBuilder<MissionsController>(
          init: MissionsController(),
          builder: (_) {
            return Column(
              children: <Widget>[
                SectionRow(),
                Expanded(
                  child: PageView(
                    controller: _.controller,
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
          }),
    );
  }
}