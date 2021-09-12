import 'package:bible_quest/globals/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/stats/achivements.dart';
import 'widgets/stats/equipment.dart';
import 'widgets/user_appBar.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              UserAppBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  EquipmentSection(),
                  AchievementsSection(),
                  SizedBox(height: 95),
                ]),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BibleQuestAppBar(),
          ),
        ],
      ),
    );
  }
}
