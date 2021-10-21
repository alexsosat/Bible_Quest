import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/app/modules/user/modules/create/views/widgets/items_tabs.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import 'package:flutter/material.dart';

import 'widgets/user_preview.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create your user"),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0,-0.3),
              child: UserPreview(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InitialItemsTabs(),
            ),
          ],
        ),
      ),
    );
  }
}
