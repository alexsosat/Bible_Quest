import 'package:bible_quest/app/modules/lectures/models/bible/bible_exports.dart';
import 'package:bible_quest/app/modules/lectures/providers/bible_provider.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

class LecturesController extends GetxController with StateMixin<Bible> {
  var currentSection = PlanSections.main.obs;

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
    //try {
    final response = await BibleProvider().getBible();
    change(response, status: RxStatus.success());
    //} catch (e) {
    //change(null, status: RxStatus.error());
    //}
  }

  Future updateReadedBooks(Map<String, dynamic> content) async {
    await Get.find<UserController>()
        .apiService
        .updateUser({"books_readed": content});
    refreshContent();
  }
}
