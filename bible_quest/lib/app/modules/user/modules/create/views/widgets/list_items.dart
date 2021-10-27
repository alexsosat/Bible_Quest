import 'package:bible_quest/app/modules/banners/models/item.dart';
import 'package:bible_quest/app/modules/user/modules/create/controllers/create_user_controller.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItems extends GetView<CreateUserController> {
  final List<Item> itemList;
  final Function(int itemId) onItemTapped;

  ListItems({
    Key? key,
    required this.itemList,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      scrollDirection: Axis.horizontal,
      children: itemList
          .map(
            (item) => Container(
              margin: EdgeInsets.only(right: 20),
              child: SpriteCard(
                size: 70,
                title: item.displayName,
                spritePath: item.imagePath,
                onPressed: () => onItemTapped(item.id),
              ),
            ),
          )
          .toList(),
    );
  }
}
