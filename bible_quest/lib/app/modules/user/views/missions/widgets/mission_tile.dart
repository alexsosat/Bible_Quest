import 'package:bible_quest/globals/tiles/percentage_tile.dart';
import 'package:bible_quest/globals/tab_icons_icons.dart';
import 'package:flutter/material.dart';

enum RewardType { money, experience, item }

class MissionTile extends StatelessWidget {
  final String title;
  final String reward;
  final RewardType rewardType;
  const MissionTile({
    Key? key,
    required this.title,
    required this.rewardType,
    required this.reward,
  }) : super(key: key);

  Widget _rewardIcon() {
    switch (rewardType) {
      case RewardType.money:
        return Icon(Icons.monetization_on_outlined, color: Colors.yellow);
      case RewardType.experience:
        return Icon(TabIcons.upgrade, color: Colors.lightBlue[200]);
      case RewardType.item:
        return Icon(TabIcons.summons, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PercentageListTile(
      percentage: 0.1,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Container(margin: EdgeInsets.only(right: 7), child: _rewardIcon()),
          Text(
            reward,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
