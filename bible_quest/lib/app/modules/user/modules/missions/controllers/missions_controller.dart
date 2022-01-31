import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:get/get.dart';

class MissionsController extends GetxController with StateMixin<User> {
  int currentPage = 0;

  @override
  onInit() {
    fetchMissions();
    super.onInit();
  }

  void fetchMissions() async {
    try {
      // isLoading(true);
    } finally {
      // isLoading(false);
    }
  }
}
