import 'package:bible_quest/bloc/user/user.dart';
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
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.body,
                title: "Cuerpo",
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.arm,
                title: "Brazos",
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.background,
                title: "Fondo",
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.pet,
                title: "Mascota",
              ),
              SpriteCard(
                spritePath: controller.user.currentItems.base,
                title: "Piel",
              ),
            ],
          );
        });
  }
}
