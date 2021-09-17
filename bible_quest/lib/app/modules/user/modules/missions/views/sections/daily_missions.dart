import 'package:bible_quest/app/modules/user/modules/missions/views/widgets/mission_tile.dart';
import 'package:flutter/material.dart';

class DailyMissions extends StatelessWidget {
  const DailyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
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
        SizedBox(height: 95),
      ],
    );
  }
}
