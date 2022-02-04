import 'package:bible_quest/app/modules/user/modules/home/controllers/user_exists_controller.dart';
import 'package:bible_quest/globals/controllers/page_controller_tamplate.dart';
import 'package:bible_quest/services/connectivity/api_call.dart';
import 'package:get/get.dart';

class HomeController extends PageControllerTemplate {
  final userExistsController = Get.find<UserExistsController>();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    try {
      await userExistsController.checkIfUserExists();
    } on HttpCallException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
