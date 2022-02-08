import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/bible_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:get/get.dart';

class LecturesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BibleController>(() => BibleController());
    Get.lazyPut<LecturesController>(() => LecturesController());
  }
}
