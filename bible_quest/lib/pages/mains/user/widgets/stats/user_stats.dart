import 'package:bible_quest/bloc/user/stats.dart';
import 'package:bible_quest/globals/progress/linear_progress_bar.dart';
import 'package:bible_quest/pages/tabs/widgets/tab_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStats extends StatelessWidget {
  final double size;
  const UserStats({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserStatsController>(
        init: UserStatsController(),
        builder: (controller) {
          return Expanded(
            flex: 6,
            child: Container(
              height: size,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LinearProgressBar(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    barColor: Colors.red,
                    currentValue: controller.content.value.health.current,
                    maxValue: controller.content.value.health.total,
                    showTextStatus: true,
                    lineWidth: 7,
                  ),
                  LinearProgressBar(
                    icon: Icon(TabIcons.upgrade, color: Colors.lightBlueAccent),
                    barColor: Colors.lightBlueAccent,
                    currentValue: controller.content.value.experience.current,
                    maxValue: controller.content.value.experience.total,
                    showTextStatus: true,
                    lineWidth: 7,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
