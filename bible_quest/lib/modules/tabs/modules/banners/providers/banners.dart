import 'package:get/get.dart';

import 'package:bible_quest/keys.dart';
import 'package:bible_quest/modules/tabs/modules/banners/models/item_banner.dart';

class ApiBannerService extends GetConnect {
  Future<List<ItemBanner>> getBanners() async {
    final response = await get(
      '${environment['web_url']}banners',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return ItemBanner.listItemBannersFromJson(response.bodyString!);
    }
  }
}
