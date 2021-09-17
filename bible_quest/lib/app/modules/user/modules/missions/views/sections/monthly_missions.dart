import 'package:bible_quest/app/modules/user/modules/missions/views/widgets/mission_tile.dart';
import 'package:flutter/material.dart';

class MonthlyMissions extends StatelessWidget {
  const MonthlyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
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
        SizedBox(height: 95),
      ],
    );
  }
}
