import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:bible_quest/globals/progress/circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStats extends GetView<UserController> {
  const UserStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 35, 20, 15),
      child: controller.obx(
        (state) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircularProgressBar(
              percent: controller.user.stats.healthPercent,
              fillColor: Colors.red,
              subtitle: "Vida",
              radius: 85,
            ),
            CircularProgressBar(
              percent: controller.user.stats.experiencePercent,
              fillColor: Colors.lightBlueAccent,
              subtitle: "Experiencia",
              radius: 85,
            ),
            CircularProgressBar(
              percent: 1.0,
              fillColor: Colors.orangeAccent,
              subtitle: "Racha",
              radius: 85,
            ),
          ],
        ),
      ),
    );
  }
}
