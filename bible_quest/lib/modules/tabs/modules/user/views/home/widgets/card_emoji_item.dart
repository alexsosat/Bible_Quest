import 'package:bible_quest/globals/cards/card_center_item.dart';
import 'package:flutter/material.dart';

class CardEmojiItem extends StatelessWidget {
  final String emoji;
  final String title;
  const CardEmojiItem({Key? key, required this.emoji, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardItem(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      centerItem: RichText(
        text: TextSpan(
            text: emoji, style: TextStyle(fontSize: 35, fontFamily: 'Noto')),
      ),
    );
  }
}
