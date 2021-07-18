import 'dart:math';

import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/card_reward_item.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(children: <Widget>[
      Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Tienda", style: Theme.of(context).textTheme.headline5)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          childAspectRatio: 0.7,
          shrinkWrap: true,
          children: _generateExamples(),
        ),
      )
    ]);
  }

  _generateExamples() {
    List<Widget> examples = List.empty(growable: true);

    do {
      examples.add(
        CardRewardItem(
          cost: Random().nextInt(100),
          item: 'assets/images/sprites/arms/default-sprite.png',
        ),
      );
    } while (examples.length < 12);

    return examples;
  }
}
