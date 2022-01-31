import 'package:bible_quest/app/modules/user/modules/missions/controllers/missions_controller.dart';
import 'package:get/get.dart';

class MissionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MissionsController>(() => MissionsController());
  }
}
