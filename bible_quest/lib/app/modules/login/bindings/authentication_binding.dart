import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
