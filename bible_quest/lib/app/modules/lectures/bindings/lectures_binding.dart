import 'package:get/get.dart';

// import 'package:bible_quest/app/modules/lectures/controllers/read_controller.dart';

import '../controllers/lectures_controller.dart';

class LecturesBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ReadController>(
    //   () => ReadController(),
    // );
    Get.lazyPut<LecturesController>(
      () => LecturesController(),
    );
  }
}
