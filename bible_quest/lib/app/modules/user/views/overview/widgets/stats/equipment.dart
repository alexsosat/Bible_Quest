import 'package:bible_quest/app/modules/banners/models/categories.dart';
import 'package:bible_quest/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:bible_quest/app/modules/user/views/overview/subpages/change_equipment.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import '../../../../../../../../globals/cards/sprite_card.dart';
import '../section/user_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentSection extends StatelessWidget {
  const EquipmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          return UserSection(
            headerTitle: "Equipamento",
            children: <SpriteCard>[
              SpriteCard(
                spritePath: controller.user.currentItems.stringtoImagePath.head,
                title: "Cabeza",
                onPressed: () => Get.find<TabsController>().goToSubTabView(
                    ChangeEquipment(category: ItemCategory.head), context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.stringtoImagePath.body,
                title: "Cuerpo",
                onPressed: () => Get.find<TabsController>().goToSubTabView(
                    ChangeEquipment(category: ItemCategory.body), context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.stringtoImagePath.arm,
                title: "Brazos",
                onPressed: () => Get.find<TabsController>().goToSubTabView(
                    ChangeEquipment(category: ItemCategory.arm), context),
              ),
              SpriteCard(
                spritePath:
                    controller.user.currentItems.stringtoImagePath.background,
                title: "Fondo",
                onPressed: () => Get.find<TabsController>().goToSubTabView(
                    ChangeEquipment(category: ItemCategory.background),
                    context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.stringtoImagePath.pet,
                title: "Mascota",
                onPressed: () => Get.find<TabsController>().goToSubTabView(
                    ChangeEquipment(category: ItemCategory.pet), context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.stringtoImagePath.base,
                title: "Piel",
                onPressed: () => Get.find<TabsController>().goToSubTabView(
                    ChangeEquipment(category: ItemCategory.base), context),
              ),
            ],
          );
        });
  }
}
