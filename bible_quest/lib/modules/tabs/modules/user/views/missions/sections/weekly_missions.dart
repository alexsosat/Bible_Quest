import 'package:bible_quest/modules/tabs/modules/user/views/missions/widgets/mission_tile.dart';
import 'package:flutter/material.dart';

class WeeklyMissions extends StatelessWidget {
  const WeeklyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
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
        SizedBox(height: 95),
      ],
    );
  }
}
