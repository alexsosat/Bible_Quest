import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/widgets/header/user_character_with_header.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/widgets/header/user_stat_align.dart';
import 'package:bible_quest/utils/icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UserHeaderLayout extends GetView<UserStatsController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (stats) => Container(
        height: 210,
        child: Stack(
          fit: StackFit.expand,
          children: [
            UserStatAlign(
              alignment: MainAxisAlignment.start,
              data: stats!.currency.toStringAsFixed(2),
              icon: AppIcons.currencyIcon,
            ),
            UserStatAlign(
              alignment: MainAxisAlignment.end,
              data: "${stats.health.current}/${stats.health.total}",
              icon: AppIcons.healthIcon,
            ),
            UserCharacterWithProgress(
              level: stats.level,
              percent: stats.experiencePercent,
            ),
          ],
        ),
      ),
    );
  }
}
