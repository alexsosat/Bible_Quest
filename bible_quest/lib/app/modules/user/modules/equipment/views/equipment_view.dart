import 'package:bible_quest/app/modules/user/modules/equipment/views/widgets/equipment_navigation.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';

class EquipmentView extends StatelessWidget {
  const EquipmentView({Key? key}) : super(key: key);

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
          Expanded(child: EquipmentSection()),
        ],
      ),
    );
  }
}
