import 'package:bible_quest/globals/card_list/item.dart';
import 'package:bible_quest/globals/card_list/list.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/pages/mains/home/widgets/current_reading_box.dart';
import 'package:bible_quest/pages/mains/home/widgets/user_stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(children: <Widget>[
      ContinueReadingBox(),
      UserStats(),
      CardList(
        title: "Gemas",
        cards: <CardItem>[
          CardItem(
            title: "Triste",
            emoji: "😥",
          ),
          CardItem(
            title: "Enojado",
            emoji: "😡",
          ),
          CardItem(
            title: "Feliz",
            emoji: "😁",
          ),
          CardItem(
            title: "Confundido",
            emoji: "😵",
          ),
        ],
      ),
    ]);
  }
}
