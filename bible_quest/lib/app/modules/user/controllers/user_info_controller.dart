import 'package:bible_quest/app/modules/user/models/user_info.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController with StateMixin<UserInfo> {
  final UserProvider _apiService = UserProvider();

  @override
  onInit() {
    _fetchUserInfo();
    super.onInit();
  }

  _fetchUserInfo() async {
    try {
      var response = await _apiService.getUserInfo();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
