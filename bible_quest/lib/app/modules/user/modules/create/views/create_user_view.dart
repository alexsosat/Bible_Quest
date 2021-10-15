import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import 'package:flutter/material.dart';

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
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                height: MediaQuery.of(context).size.height/2 - 250,
                child: ListView(
                  padding: EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  children: StartItems.heads.map((item) => Container(
                    margin: EdgeInsets.only(right: 20),
                    child: SpriteCard(
                      size: 70,
                      title: item.displayName,
                      spritePath: item.imagePath,
                    ),
                  ),).toList(),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
