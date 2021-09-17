import 'package:bible_quest/globals/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/achivements.dart';
import 'widgets/equipment.dart';
import 'widgets/user_appBar.dart';

class EquipmentView extends StatelessWidget {
  const EquipmentView({Key? key}) : super(key: key);

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
