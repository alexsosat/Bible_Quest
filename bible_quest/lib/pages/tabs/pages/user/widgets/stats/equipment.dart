import 'package:bible_quest/bloc/navigation.dart';
import 'package:bible_quest/bloc/user/user.dart';
import 'package:bible_quest/models/items/item.dart';
import 'package:bible_quest/pages/tabs/pages/user/subpages/change_equipment.dart';
import 'package:bible_quest/pages/tabs/pages/user/widgets/section/sprite_card.dart';
import 'package:bible_quest/pages/tabs/pages/user/widgets/section/user_section.dart';
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
                spritePath: controller.user.currentItems.head,
                title: "Cabeza",
                onPressed: () =>
                    Get.find<NavigationController>().goToSubTabView(
                        ChangeEquipment(
                          items: controller.user
                              .itemfromCategory(ItemCategory.head),
                        ),
                        context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.body,
                title: "Cuerpo",
                onPressed: () =>
                    Get.find<NavigationController>().goToSubTabView(
                        ChangeEquipment(
                          items: controller.user
                              .itemfromCategory(ItemCategory.body),
                        ),
                        context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.arm,
                title: "Brazos",
                onPressed: () =>
                    Get.find<NavigationController>().goToSubTabView(
                        ChangeEquipment(
                          items: controller.user
                              .itemfromCategory(ItemCategory.arms),
                        ),
                        context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.background,
                title: "Fondo",
                onPressed: () =>
                    Get.find<NavigationController>().goToSubTabView(
                        ChangeEquipment(
                          items: controller.user
                              .itemfromCategory(ItemCategory.background),
                        ),
                        context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.pet,
                title: "Mascota",
                onPressed: () =>
                    Get.find<NavigationController>().goToSubTabView(
                        ChangeEquipment(
                          items: controller.user
                              .itemfromCategory(ItemCategory.pet),
                        ),
                        context),
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.base,
                title: "Piel",
                onPressed: () =>
                    Get.find<NavigationController>().goToSubTabView(
                        ChangeEquipment(
                          items: controller.user
                              .itemfromCategory(ItemCategory.base),
                        ),
                        context),
              ),
            ],
          );
        });
  }
}
