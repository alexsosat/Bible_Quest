import 'package:bible_quest/api/banners/banners.dart';
import 'package:bible_quest/bloc/abstract_model.dart';
import 'package:bible_quest/models/items/item_banner.dart';
import 'package:get/get.dart';

class StoreController extends ControllerTemplate {
  var banners = List<ItemBanner>.empty(growable: true).obs;

  @override
  onInit() {
    fetchBanners();
    super.onInit();
  }

  @override
  refreshContent() {
    fetchBanners();
    super.refreshContent();
  }

  void fetchBanners() async {
    try {
      isLoading(true);
      banners(await ApiBannerService().getBanners());
    } finally {
      isLoading(false);
    }
  }
}
