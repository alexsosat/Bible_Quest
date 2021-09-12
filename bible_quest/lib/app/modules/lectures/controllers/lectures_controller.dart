import 'package:bible_quest/app/modules/lectures/models/bible/bible_exports.dart';
import 'package:bible_quest/app/modules/lectures/providers/bible_provider.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

class LecturesController extends GetxController {
  Bible bible = Bible.instance();

  @override
  void onInit() {
    fetchContent();
    super.onInit();
  }

  void refreshContent() {
    fetchContent();
    update();
  }

  void fetchContent() async {
    try {
      // isLoading(true);
      await fetchPlans();
    } finally {
      // isLoading(false);
      update();
    }
  }

  Future<void> fetchPlans() async {
    final response = await BibleProvider().getBible();

    bible = response;
  }

  Future updateReadedBooks(Map<String, dynamic> content) async {
    await Get.find<UserController>()
        .apiService
        .updateUser({"books_readed": content});
    refreshContent();
  }
}
