import '../../../../../../../../globals/cards/sprite_card.dart';
import '../section/user_section.dart';
import 'package:flutter/material.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserSection(
      headerTitle: "Logros",
      children: <SpriteCard>[
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
        SpriteCard(
          spritePath: 'assets/images/sprites/arm/tile000.png',
          title: "default sprite",
        ),
      ],
    );
  }
}
