import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/widgets/equipment_change.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:bible_quest/utils/enum_convertors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ChangeEquipmentView extends StatelessWidget {
  const ChangeEquipmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipment"),
      ),
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
            child: EquipmentChange(
              section: enumFromString(Get.parameters['category'] ?? 'head',
                  EquipmentSectionPage.values)!,
            ),
          ),
        ],
      ),
    );
  }
}
