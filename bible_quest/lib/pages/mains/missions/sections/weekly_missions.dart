import 'package:bible_quest/globals/round_tile.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/pages/mains/missions/widgets/round_mission_tile.dart';
import 'package:flutter/material.dart';

class WeeklyMissions extends StatelessWidget {
  const WeeklyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TabPage(
        topSpace: 0,
        bottomSpace: 95,
        children: <Widget>[
          MissionTile(
            title: "Leer siete capítulos del Génesis",
            rewardType: RewardType.money,
            reward: "30",
          ),
          MissionTile(
            title: "Llegar al nivel 5",
            rewardType: RewardType.experience,
            reward: "150",
          ),
          MissionTile(
            title: "Memoriza el versículo de memoria",
            rewardType: RewardType.item,
            reward: "Biblia",
          ),
        ],
      ),
    );
  }
}
