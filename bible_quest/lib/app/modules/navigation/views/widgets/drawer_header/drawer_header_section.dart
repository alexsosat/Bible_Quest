import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';

import 'user_header_data.dart';

class DrawerHeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
        height: 150,
        child: Row(
          children: [
            UserCharacter(
              size: 76,
              shape: BoxShape.circle,
            ),
            UserHeaderData(),
            Expanded(child: SizedBox()),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
