import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());

    Get.lazyPut<UserInfoController>(
      () => UserInfoController(),
    );

    // Get.lazyPut<CurrentReadingController>(
    //   () => CurrentReadingController(),
    // );
  }
}
