import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:bible_quest/pages/tabs/pages/missions/widgets/mission_tile.dart';
import 'package:flutter/material.dart';

class MonthlyMissions extends StatelessWidget {
  const MonthlyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TabPage(
        topSpace: 0,
        bottomSpace: 95,
        children: <Widget>[
          MissionTile(
            title: "Terminar el libro de Génesis",
            rewardType: RewardType.money,
            reward: "30",
          ),
          MissionTile(
            title: "Consigue 5 insignias",
            rewardType: RewardType.experience,
            reward: "250",
          ),
          MissionTile(
            title: "Llegar al nivel 10",
            rewardType: RewardType.item,
            reward: "Tunica de Jose",
          ),
        ],
      ),
    );
  }
}
