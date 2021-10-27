import 'package:bible_quest/app/modules/user/modules/home/views/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: HomeAppbar(),
      ),
      body: Center(
        child: Text("Home body"),
      ),
    );
    /* return TabPage(children: <Widget>[
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
    ]);*/
  }
}
