import 'dart:math';

import 'package:bible_quest/app/modules/banners/models/item.dart';
import 'package:bible_quest/app/modules/banners/models/item_banner.dart';
import 'package:bible_quest/app/modules/banners/models/reward_item.dart';
import 'package:bible_quest/app/modules/banners/providers/banner_api_provider.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

class BannersController extends GetxController {
  var banners = List<ItemBanner>.empty(growable: true).obs;

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
    try {
      // isLoading(true);
      banners(await BannerApiProvider().getBanners());
    } finally {
      // isLoading(false);
      update();
    }
  }

  Future<List<RewardItem>> buyItem(ItemBanner banner, int count) async {
    List<RewardItem> rewards = List.empty(growable: true);
    double weight = 0;
    banner.items.forEach((element) => weight += element.appearRate);
    final user = Get.find<UserController>().user;

    for (int i = 0; i < count; i++) {
      if (i < 5) {
        print("entre $i");
        user.stats.currency -= banner.cost;
      }
      double random = Random().nextDouble() * weight;
      Item rewardItem = _getBannerItem(banner, random);
      int searchValue = user.items
          .indexWhere((element) => element.assetName == rewardItem.assetName);
      if (searchValue == -1) {
        user.items.add(rewardItem);
        rewards.add(
          RewardItem(
            displayName: rewardItem.displayName,
            imagePath: rewardItem.imagePath,
          ),
        );
      } else {
        user.stats.currency += banner.cost * 1.25;
        rewards.add(
          RewardItem(
            displayName: (banner.cost * 1.25).toStringAsFixed(2),
            imagePath: RewardItem.coinImage,
          ),
        );
      }
    }
    Map<String, dynamic> json = user.toJson();

    await Get.find<UserController>()
        .updateUser({'currency': json['currency'], 'items': json['items']});

    return rewards;
  }

  Item _getBannerItem(ItemBanner banner, double random) {
    double itemProgress = 0;
    int index = 0;
    while (random > itemProgress) {
      itemProgress += banner.items[index].appearRate;
      index++;
    }

    return banner.items[index - 1];
  }
}