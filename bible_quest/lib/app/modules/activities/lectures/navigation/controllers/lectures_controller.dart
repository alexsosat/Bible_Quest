import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/bible.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/book.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/providers/bible_provider.dart';
import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class LecturesController extends GetxController with StateMixin<Bible> {
  var currentSection = PlanSections.main.obs;

  var userReadings;

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
      userReadings = await UserProvider().getUserReadings();
      final response = await BibleProvider().getBible(userReadings);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future updateReadedBooks(Map<String, dynamic> content) async {
    await UserProvider().updateUser(
      Get.find<UserInfoController>().userInfo.id,
      {"books_readed": content},
    );
    refreshContent();
  }
}
