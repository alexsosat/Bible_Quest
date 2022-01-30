import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/controllers/current_reading_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/controllers/user_exists_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserExistsController>(UserExistsController());

    Get.lazyPut<UserInfoController>(
      () => UserInfoController(),
    );
    Get.lazyPut<UserStatsController>(
      () => UserStatsController(),
    );

    Get.lazyPut<CurrentReadingController>(
      () => CurrentReadingController(),
    );
  }
}
