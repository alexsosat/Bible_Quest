import 'package:get/get.dart';

import 'package:bible_quest/app/modules/user/controllers/current_reading_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/missions_controller.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MissionsController>(
      () => MissionsController(),
    );

    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
