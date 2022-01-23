import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/store/banners/controllers/banners_list_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/controllers/current_reading_controller.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());

    Get.lazyPut<UserInfoController>(
      () => UserInfoController(),
    );
    Get.lazyPut<UserStatsController>(
      () => UserStatsController(),
    );

    Get.lazyPut<CurrentReadingController>(
      () => CurrentReadingController(),
    );

    Get.lazyPut<LecturesController>(
      () => LecturesController(),
    );

    Get.lazyPut<BannersListController>(
      () => BannersListController(),
    );
  }
}
