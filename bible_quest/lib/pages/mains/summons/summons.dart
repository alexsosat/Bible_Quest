import 'package:bible_quest/globals/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/card_summon_item.dart';

class SummonsPage extends StatelessWidget {
  const SummonsPage({Key? key}) : super(key: key);

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
              CardSummonItem(
                cost: 15,
                item: '',
              ),
              CardSummonItem(
                cost: 20,
                item: '',
              ),
              CardSummonItem(
                cost: 45,
                item: '',
              ),
              CardSummonItem(
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
