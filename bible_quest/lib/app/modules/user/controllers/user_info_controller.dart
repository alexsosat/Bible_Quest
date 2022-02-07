import 'package:bible_quest/app/modules/user/models/current_items.dart';
import 'package:bible_quest/app/modules/user/models/user_info.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/globals/controllers/api_controller_template.dart';
import 'package:get/get.dart';

class UserInfoController extends ApiControllerTemplate<UserInfo> {
  final UserProvider _apiService = UserProvider();

  @override
  Future loadData() async {
    change(null, status: RxStatus.loading());
    await call<UserInfo>(
      httpCall: () => _apiService.getUserInfo(),
      onSuccess: (info) {
        change(info, status: RxStatus.success());
      },
      onCallError: (error) => throw error,
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );
  }

  updateUserItems(CurrentItems newCurrentItems) async {
    await _apiService.updateUserCurrentItems(newCurrentItems);
    loadData();
  }
}
