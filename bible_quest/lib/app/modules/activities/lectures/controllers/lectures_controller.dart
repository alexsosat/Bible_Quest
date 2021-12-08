import 'package:bible_quest/app/modules/activities/lectures/models/bible/indexes/bible.dart';
import 'package:bible_quest/app/modules/activities/lectures/models/bible/indexes/book.dart';
import 'package:bible_quest/app/modules/activities/lectures/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/providers/bible_provider.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class LecturesController extends GetxController with StateMixin<Bible> {
  var currentSection = PlanSections.main.obs;

  Book? activeBook;

  @override
  void onInit() {
    fetchPlans();
    super.onInit();
  }

  void refreshContent() {
    fetchPlans();
    update();
  }

  Future<void> fetchPlans() async {
    try {
      final readResponse = await UserProvider().getUserReadings();
      final response = await BibleProvider().getBible(readResponse);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future updateReadedBooks(Map<String, dynamic> content) async {
    await Get.find<UserController>()
        .apiService
        .updateUser({"books_readed": content});
    refreshContent();
  }
}
