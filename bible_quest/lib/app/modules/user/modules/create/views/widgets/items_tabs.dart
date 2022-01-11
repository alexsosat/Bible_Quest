import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/app/modules/user/modules/create/controllers/create_user_controller.dart';
import 'package:bible_quest/app/modules/user/modules/create/views/widgets/list_items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InitialItemsTabs extends GetView<CreateUserController> {
  const InitialItemsTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 - 185,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.accessibility_new,
                  size: 32,
                )),
                Tab(icon: Icon(FontAwesomeIcons.userAlt)),
                Tab(icon: Icon(FontAwesomeIcons.tshirt)),
              ],
            ),
            Container(
              height: 170,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListItems(
                    itemList: StartItems.base,
                    onItemTapped: (itemId) => controller.baseSprite(itemId),
                  ),
                  ListItems(
                    itemList: StartItems.heads,
                    onItemTapped: (itemId) => controller.headSprite(itemId),
                  ),
                  ListItems(
                    itemList: StartItems.bodies,
                    onItemTapped: (itemId) => controller.bodySprite(itemId),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
