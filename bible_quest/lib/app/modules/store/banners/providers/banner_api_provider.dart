import 'dart:convert';

import 'package:bible_quest/app/modules/store/banners/models/item_banner.dart';
import 'package:bible_quest/keys.dart';
import 'package:get/get.dart';

class BannerApiProvider extends GetConnect {
  Future<List<ItemBanner>> getBanners() async {
    final response = await get(
      '${keys['web_url']}banners/list',
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

  Future<ItemBanner> getBannerById(int bannerId) async {
    final response = await get(
      '${keys['web_url']}banners/$bannerId',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return ItemBanner.fromJson(json.decode(response.bodyString!));
    }
  }
}
