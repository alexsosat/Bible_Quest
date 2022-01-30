import 'package:bible_quest/app/modules/store/banners/controllers/banners_list_controller.dart';
import 'package:get/get.dart';

class BannersListBinding implements Bindings {
  BannersListBinding();

  @override
  void dependencies() {
    Get.lazyPut<BannersListController>(() => BannersListController());
  }
}
