import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/bible_controller.dart';
import 'package:bible_quest/globals/controllers/page_controller_tamplate.dart';
import 'package:get/get.dart';

class LecturesController extends PageControllerTemplate {
  @override
  void onInit() {
    apiControllers = [
      Get.find<BibleController>(),
    ];
    loadPage();
    super.onInit();
  }
}
