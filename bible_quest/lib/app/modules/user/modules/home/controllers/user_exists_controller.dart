import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:bible_quest/globals/controllers/api_controller_template.dart';
import 'package:bible_quest/services/connectivity/api_call.dart';

import 'package:get/get.dart';

class UserExistsController extends ApiControllerTemplate {
  final UserProvider _apiService = UserProvider();

  HttpCallException? callError;

  @override
  Future loadData() async {
    change(null, status: RxStatus.loading());
    await call<bool>(
      httpCall: () => _apiService.userExists(),
      onSuccess: (exists) {
        if (!exists) Get.offAndToNamed(Routes.CREATE);
      },
      onCallError: (error) => throw error,
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );
  }
}
