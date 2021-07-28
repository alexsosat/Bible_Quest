import 'package:bible_quest/api/bible/fetch_bible.dart';
import 'package:bible_quest/bloc/user/user.dart';
import 'package:bible_quest/models/bible/indexes/bible.dart';
import 'package:get/get.dart';

import '../abstract_model.dart';

class PlansController extends ControllerTemplate {
  PlansController();

  Bible bible = Bible.instance();

  @override
  void onInit() {
    fetchContent();
    super.onInit();
  }

  @override
  void refreshContent() {
    fetchContent();
    update();
    super.refreshContent();
  }

  void fetchContent() async {
    try {
      isLoading(true);
      await fetchPlans();
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchPlans() async {
    final response = await ApiBibleService().getBible();

    bible = response;
  }

  Future updateReadedBooks(Map<String, dynamic> content) async {
    await Get.find<UserController>()
        .apiService
        .updateUser({"books_readed": content});
    refreshContent();
  }
}
