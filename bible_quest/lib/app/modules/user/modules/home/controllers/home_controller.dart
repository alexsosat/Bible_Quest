import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/controllers/user_exists_controller.dart';
import 'package:bible_quest/globals/controllers/page_controller_tamplate.dart';
import 'package:get/get.dart';

class HomeController extends PageControllerTemplate {
  @override
  void onInit() {
    apiControllers = [
      Get.find<UserExistsController>(),
      Get.find<UserInfoController>(),
      Get.find<UserStatsController>(),
    ];
    loadPage();
    super.onInit();
  }

  @override
  void refreshContent() {
    errorOcurred(false);
    loadPage();
    super.refresh();
  }
}
