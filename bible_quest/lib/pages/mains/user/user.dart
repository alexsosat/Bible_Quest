import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/section/sprite_card.dart';
import 'widgets/section/user_section.dart';
import 'widgets/stats/stat_section.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(
      children: <Widget>[
        UserStatSection(),
        UserSection(
          headerTitle: "Equipamento",
          children: <SpriteCard>[
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
          ],
        ),
        UserSection(
          headerTitle: "Logros",
          children: <SpriteCard>[
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
            SpriteCard(
              spritePath: 'assets/images/sprites/arms/default-sprite.png',
              title: "default sprite",
            ),
          ],
        ),
      ],
    );
  }
}
