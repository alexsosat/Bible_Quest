import 'package:bible_quest/globals/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/card_reward_item.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 20,
            runSpacing: 20,
            children: [
              CardRewardItem(
                cost: 15,
                item: '',
              ),
              CardRewardItem(
                cost: 20,
                item: '',
              ),
              CardRewardItem(
                cost: 45,
                item: '',
              ),
              CardRewardItem(
                cost: 100,
                item: '',
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
