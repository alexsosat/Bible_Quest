import 'package:bible_quest/app/modules/user/modules/create/controllers/create_user_controller.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    // Get.lazyPut<CurrentReadingController>(
    //   () => CurrentReadingController(),
    // );
  }
}
