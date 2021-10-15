import 'package:bible_quest/app/modules/user/modules/create/controllers/create_user_controller.dart';
import 'package:get/get.dart';

class CreateUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUserController>(
      () => CreateUserController(),
    );
  }
}
