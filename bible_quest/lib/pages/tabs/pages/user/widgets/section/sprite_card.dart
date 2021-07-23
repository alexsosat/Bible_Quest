import 'package:bible_quest/globals/cards/card_display.dart';
import 'package:flutter/material.dart';

class SpriteCard extends StatelessWidget {
  final String spritePath;
  final String title;

  const SpriteCard({
    Key? key,
    required this.spritePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDisplay(
      content: Image.asset(
        spritePath,
        height: 60,
        width: 60,
        fit: BoxFit.contain,
      ),
      title: Container(
        width: 50,
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
