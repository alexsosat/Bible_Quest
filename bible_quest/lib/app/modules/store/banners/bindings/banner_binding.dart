import 'package:bible_quest/app/modules/store/banners/controllers/banner_controller.dart';
import 'package:get/get.dart';

class BannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(
      () => BannerController(
        int.parse(Get.parameters["banner_id"]!),
      ),
    );
  }
}
