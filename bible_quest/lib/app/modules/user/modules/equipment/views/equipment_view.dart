import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/widgets/equipment_menu.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:bible_quest/utils/enum_convertors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class EquipmentView extends StatelessWidget {
  const EquipmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipment"),
      ),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                UserCharacter(size: 50),
              ],
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: EquipmentMenu(
              onSelect: (page) =>
                  Get.toNamed(Routes.EQUIPMENTCHANGE(enumToString(page))),
            ),
          ),
        ],
      ),
    );
  }
}