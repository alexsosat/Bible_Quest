import 'package:bible_quest/app/modules/store/banners/models/item_banner.dart';
import 'package:bible_quest/app/modules/store/banners/providers/banner_api_provider.dart';
import 'package:get/get.dart';

class BannersListController extends GetxController
    with StateMixin<List<ItemBanner>> {
  @override
  onInit() {
    fetchBanners();
    super.onInit();
  }

  refreshContent() {
    fetchBanners();
    refreshContent();
  }

  void fetchBanners() async {
    // try {
    final banners = await BannerApiProvider().getBanners();
    if (banners.isEmpty)
      change(null, status: RxStatus.empty());
    else
      change(banners, status: RxStatus.success());
    // } catch (e) {
    //   change(null, status: RxStatus.error());
    // }
  }
}
