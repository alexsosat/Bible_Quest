import 'package:bible_quest/app/modules/user/modules/home/views/widgets/header/level_clipper.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserCharacterWithProgress extends StatelessWidget {
  final int level;
  final double percent;

  const UserCharacterWithProgress({
    Key? key,
    required this.level,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: UserCharacter(
              size: 110,
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: CircularPercentIndicator(
              radius: 110,
              backgroundWidth: 7,
              lineWidth: 7,
              percent: percent,
              animation: true,
              progressColor: Colors.lightBlue,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.55),
            child: ClipPath(
              clipper: LevelClipPath(),
              child: Container(
                height: 25,
                width: 70,
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
                      "Lv. $level",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
