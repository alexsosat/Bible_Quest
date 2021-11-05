import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/globals/data_display/user_stat_indicator.dart';
import 'package:bible_quest/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHeaderData extends GetView<UserStatsController> {
  final String? username = Get.find<AuthenticationController>().username;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (stats) => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              username ?? "",
              style: Get.textTheme.subtitle1,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                UserStatIndicator(
                  separation: 0,
                  icon: AppIcons.healthIcon,
                  data: "${stats!.health.current}/${stats.health.total}",
                ),
                SizedBox(width: 10),
                UserStatIndicator(
                  separation: 0,
                  icon: AppIcons.currencyIcon,
                  data: "${stats.currency}",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
