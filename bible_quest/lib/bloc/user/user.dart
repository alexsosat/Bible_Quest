import 'package:bible_quest/api/user/fetch_user.dart';
import 'package:bible_quest/models/user/user.dart';
import 'package:get/get.dart';

import '../abstract_model.dart';

class UserController extends ControllerTemplate {
  var content = User.instance().obs;

  final UserService apiService = UserService();

  @override
  onInit() {
    fetchUser();
    super.onInit();
  }

  @override
  refreshContent() {
    fetchUser();
    super.refreshContent();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var response = await apiService.getUser();
      content(response);
    } finally {
      isLoading(false);
    }
  }

  User get user => content.value;

  void updateUser(Map<String, dynamic> content) async {
    apiService.updateUser(content);
  }

  void updateCurrency(double value) {
    content.value.stats.currency += value;
    update();
  }

  void updateHealth(int value) {
    content.value.stats.health.current += value;
    update();
  }
}
