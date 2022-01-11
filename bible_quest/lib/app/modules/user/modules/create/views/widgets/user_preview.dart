import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/app/modules/user/modules/create/controllers/create_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPreview extends GetView<CreateUserController> {
  const UserPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 200,
        width: 200,
        child: Obx(() {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                StartItems.base[controller.baseSprite.value].imagePath,
                fit: BoxFit.contain,
              ),
              Image.asset(
                StartItems.bodies[controller.bodySprite.value].imagePath,
                fit: BoxFit.contain,
              ),
              Image.asset(StartItems.outline.imagePath),
              Image.asset(
                StartItems.heads[controller.headSprite.value].imagePath,
                fit: BoxFit.contain,
              ),
            ],
          );
        }),
      ),
    );
  }
}
