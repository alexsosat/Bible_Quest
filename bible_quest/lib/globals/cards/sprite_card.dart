import 'package:bible_quest/globals/cards/card_display.dart';
import 'package:flutter/material.dart';

class SpriteCard extends StatelessWidget {
  final String? spritePath;
  final String title;
  final double size;
  final Function()? onPressed;

  const SpriteCard({
    Key? key,
    required this.spritePath,
    required this.title,
    this.onPressed,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDisplay(
      onPressed: onPressed,
      content: (spritePath != null)
          ? Image.asset(
              spritePath!,
              height: size,
              width: size,
              fit: BoxFit.contain,
            )
          : Container(
              height: size,
              width: size,
            ),
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: size,
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
