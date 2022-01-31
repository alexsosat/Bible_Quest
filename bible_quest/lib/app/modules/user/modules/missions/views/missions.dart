import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'sections/daily_missions.dart';
import 'sections/monthly_missions.dart';
import 'sections/weekly_missions.dart';

class MissionsView extends StatefulWidget {
  MissionsView({Key? key}) : super(key: key);

  @override
  _MissionsViewState createState() => _MissionsViewState();
}

class _MissionsViewState extends State<MissionsView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipment"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Día"),
            Tab(text: "Semana"),
            Tab(text: "Mes"),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          ///Page 1
          DailyMissions(),

          ///Page 2
          WeeklyMissions(),

          ///Page 3
          MonthlyMissions(),
        ],
      ),
    );
  }
}
