import 'package:bible_quest/globals/layout/horizontal_list.dart';
import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/card_emoji_item.dart';
import 'widgets/current_reading_box.dart';
import 'widgets/user_stats.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(children: <Widget>[
      ContinueReadingBox(),
      UserStats(),
      CardList(
        title: "Gemas",
        cards: <Widget>[
          CardEmojiItem(
            title: "Triste",
            emoji: "😥",
          ),
          CardEmojiItem(
            title: "Enojado",
            emoji: "😡",
          ),
          CardEmojiItem(
            title: "Feliz",
            emoji: "😁",
          ),
          CardEmojiItem(
            title: "Confundido",
            emoji: "😵",
          ),
        ],
      ),
    ]);
  }
}
