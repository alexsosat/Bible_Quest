import 'package:bible_quest/app/modules/store/banners/controllers/banner_controller.dart';
import 'package:get/get.dart';

class BannerBinding implements Bindings {
  final int bannerId;

  BannerBinding(this.bannerId);

  @override
  void dependencies() {
    Get.lazyPut<BannerController>(() => BannerController(bannerId));
  }
}
