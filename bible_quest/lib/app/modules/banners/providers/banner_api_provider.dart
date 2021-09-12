import 'package:bible_quest/app/modules/banners/models/item_banner.dart';
import 'package:bible_quest/keys.dart';
import 'package:get/get.dart';

class BannerApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

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
