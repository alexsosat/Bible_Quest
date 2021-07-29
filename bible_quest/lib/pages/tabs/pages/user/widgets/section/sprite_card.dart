import 'package:bible_quest/globals/cards/card_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpriteCard extends StatelessWidget {
  final String? spritePath;
  final String title;

  const SpriteCard({
    Key? key,
    required this.spritePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDisplay(
      onPressed: () {
        Get.dialog(
          AlertDialog(
            title: Text("Selecciona el objeto a equipar"),
            content: Text("Objetos"),
          ),
        );
      },
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
