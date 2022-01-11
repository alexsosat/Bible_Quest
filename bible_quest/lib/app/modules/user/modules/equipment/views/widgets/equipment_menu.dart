import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import '../../../../../../../globals/cards/sprite_card.dart';
import 'user_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentMenu extends GetView<UserInfoController> {
  final Function(EquipmentSectionPage page) onSelect;
  const EquipmentMenu({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => UserSection(
        headerTitle: "Equipamento",
        children: <SpriteCard>[
          SpriteCard(
            spritePath: state!.currentItems.stringtoImagePath.head,
            title: "Cabeza",
            onPressed: () => onSelect(EquipmentSectionPage.head),
          ),
          SpriteCard(
            spritePath: state.currentItems.stringtoImagePath.body,
            title: "Cuerpo",
            onPressed: () => onSelect(EquipmentSectionPage.body),
          ),
          SpriteCard(
            spritePath: state.currentItems.stringtoImagePath.arm,
            title: "Brazos",
            onPressed: () => onSelect(EquipmentSectionPage.arm),
          ),
          SpriteCard(
            spritePath: state.currentItems.stringtoImagePath.background,
            title: "Fondo",
            onPressed: () => onSelect(EquipmentSectionPage.background),
          ),
          SpriteCard(
            spritePath: state.currentItems.stringtoImagePath.pet,
            title: "Mascota",
            onPressed: () => onSelect(EquipmentSectionPage.pet),
          ),
          SpriteCard(
            spritePath: state.currentItems.stringtoImagePath.base,
            title: "Piel",
            onPressed: () => onSelect(EquipmentSectionPage.base),
          ),
        ],
      ),
    );
  }
}
