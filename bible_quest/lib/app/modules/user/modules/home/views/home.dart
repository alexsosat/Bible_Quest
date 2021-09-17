import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(
            onPressed: () => Get.find<NavigationController>()
                .drawerKey
                .currentState!
                .openDrawer(),
            icon: Icon(
              Icons.menu,
            )),
      ),
      body: Center(
        child: Text("Home body"),
      ),
    );
    /* return TabPage(children: <Widget>[
      ContinueReadingBox(),
      UserStats(),
      CardList(
        title: "Gemas",
        cards: <Widget>[
          CardEmojiItem(
            title: "Triste",
            emoji: "😥",
          ),
          CardEmojiItem(
            title: "Enojado",
            emoji: "😡",
          ),
          CardEmojiItem(
            title: "Feliz",
            emoji: "😁",
          ),
          CardEmojiItem(
            title: "Confundido",
            emoji: "😵",
          ),
        ],
      ),
    ]);*/
  }
}
