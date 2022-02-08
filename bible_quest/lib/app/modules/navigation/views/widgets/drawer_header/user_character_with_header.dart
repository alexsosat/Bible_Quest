import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/widgets/header/level_clipper.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserCharacterWithProgress extends GetView<UserStatsController> {
  final double size;

  const UserCharacterWithProgress({
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child: UserCharacter(
                size: size,
                shape: BoxShape.circle,
                justUserFace: true,
              ),
            ),
            Center(
              child: CircularPercentIndicator(
                radius: size / 2,
                backgroundWidth: 5,
                lineWidth: 5,
                percent: state!.experiencePercent,
                animation: true,
                progressColor: Colors.lightBlue,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: ClipPath(
                clipper: LevelClipPath(),
                child: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black,
                      ),
                      const BoxShadow(
                        color: Colors.deepPurple,
                        spreadRadius: -12.0,
                        blurRadius: 12.0,
                      ),
                    ],
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Lv. ${state.level}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
