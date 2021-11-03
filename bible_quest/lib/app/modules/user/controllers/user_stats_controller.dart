import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class UserStatsController extends GetxController with StateMixin<Stats> {
  final UserProvider _apiService = UserProvider();

  @override
  onInit() {
    _fetchUserInfo();
    super.onInit();
  }

  _fetchUserInfo() async {
    try {
      var response = await _apiService.getUserStats();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
