import 'package:bible_quest/app/modules/navigation/views/widgets/drawer_header/user_character_with_header.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';

import 'user_header_data.dart';

class DrawerHeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Container(
        height: 150,
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: UserCharacterWithProgress(
                size: 90,
              ),
            ),
            Flexible(flex: 3, child: UserHeaderData()),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
