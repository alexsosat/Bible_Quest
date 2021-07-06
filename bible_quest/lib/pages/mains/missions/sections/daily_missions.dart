import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/pages/mains/missions/widgets/mission_tile.dart';
import 'package:flutter/material.dart';

class DailyMissions extends StatelessWidget {
  const DailyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TabPage(
        topSpace: 0,
        bottomSpace: 95,
        children: <Widget>[
          MissionTile(
            title: "Leer dos capítulos del Génesis",
            rewardType: RewardType.money,
            reward: "15",
          ),
          MissionTile(
            title: "Jugar un minijuego",
            rewardType: RewardType.experience,
            reward: "150",
          ),
          MissionTile(
            title: "Estudia la matutina",
            rewardType: RewardType.item,
            reward: "Vara de Aaron",
          ),
        ],
      ),
    );
  }
}
