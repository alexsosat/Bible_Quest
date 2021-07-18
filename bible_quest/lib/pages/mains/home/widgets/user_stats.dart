import 'package:bible_quest/bloc/user/stats.dart';
import 'package:bible_quest/globals/progress/circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStats extends StatelessWidget {
  const UserStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 35, 20, 15),
      child: GetBuilder<UserStatsController>(
          init: UserStatsController(),
          builder: (controller) {
            if (controller.isLoading.value)
              return Center(child: CircularProgressIndicator());
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircularProgressBar(
                  percent: controller.content.value.healthPercent,
                  fillColor: Colors.red,
                  subtitle: "Vida",
                  radius: 85,
                ),
                CircularProgressBar(
                  percent: controller.content.value.experiencePercent,
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
            );
          }),
    );
  }
}
