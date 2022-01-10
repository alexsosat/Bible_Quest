import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/widgets/equipment_navigation.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/equipment_menu.dart';

class EquipmentView extends StatelessWidget {
  const EquipmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipment"),
        leading: IconButton(
            onPressed: () => Get.find<NavigationController>()
                .drawerKey
                .currentState!
                .openDrawer(),
            icon: Icon(
              Icons.menu,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: UserCharacter(size: 200)),
          SizedBox(height: 40),
          Expanded(child: EquipmentSection()),
        ],
      ),

      // CustomScrollView(
      //   physics: BouncingScrollPhysics(),
      //   slivers: [
      //     UserAppBar(),
      //     SliverList(
      //       delegate: SliverChildListDelegate([
      //         EquipmentSection(),
      //         AchievementsSection(),
      //         SizedBox(height: 95),
      //       ]),
      //     ),
      //   ],
      // ),
    );
  }
}
