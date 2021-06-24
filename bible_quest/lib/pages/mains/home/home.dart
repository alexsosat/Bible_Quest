import 'package:bible_quest/globals/card_list/item.dart';
import 'package:bible_quest/globals/card_list/list.dart';
import 'package:bible_quest/pages/mains/home/widgets/current_reading_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          ContinueReadingBox(),
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
        ],
      ),
    );
  }
}
