import 'package:bible_quest/globals/cards/card_display.dart';
import 'package:flutter/material.dart';

class SpriteCard extends StatelessWidget {
  final String? spritePath;
  final String title;
  final Function()? onPressed;

  const SpriteCard({
    Key? key,
    required this.spritePath,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDisplay(
      onPressed: onPressed,
      content: (spritePath != null)
          ? Image.asset(
              spritePath!,
              height: 60,
              width: 60,
              fit: BoxFit.contain,
            )
          : Container(
              height: 60,
              width: 60,
            ),
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: 60,
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
