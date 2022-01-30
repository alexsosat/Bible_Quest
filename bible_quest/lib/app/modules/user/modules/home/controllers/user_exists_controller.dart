import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:get/get.dart';

class UserExistsController extends GetxController {
  final UserProvider _apiService = UserProvider();

  @override
  void onInit() {
    checkIfUserExists();
    super.onInit();
  }

  void checkIfUserExists() async {
    bool userExists = await _apiService.userExists();
    if (!userExists) Get.offAndToNamed(Routes.CREATE);
  }
}
