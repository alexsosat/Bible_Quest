import 'dart:math';

import 'package:bible_quest/app/modules/store/banners/models/item.dart';
import 'package:bible_quest/app/modules/store/banners/models/item_banner.dart';
import 'package:bible_quest/app/modules/store/banners/models/reward_item.dart';
import 'package:bible_quest/app/modules/store/banners/providers/banner_api_provider.dart';
import 'package:bible_quest/app/modules/user/controllers/user_stats_controller.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class BannerController extends GetxController with StateMixin<ItemBanner> {
  final int _bannerId;

  BannerController(this._bannerId);

  @override
  onInit() {
    fetchBanner();
    super.onInit();
  }

  refreshContent() {
    fetchBanner();
    refreshContent();
  }

  void fetchBanner() async {
    try {
      final banners = await BannerApiProvider().getBannerById(_bannerId);
      change(banners, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future<List<RewardItem>> buyItem(ItemBanner banner, int count) async {
    List<RewardItem> rewards = List.empty(growable: true);
    double weight = 0;
    banner.items?.forEach((element) => weight += element.appearRate);
    final _userApi = UserProvider();
    final userStats = Get.find<UserStatsController>().data;
    final userItems = await _userApi.getAllUserItems();

    for (int i = 0; i < count; i++) {
      if (i < 5) {
        print("entre $i");
        userStats.currency -= banner.cost;
      }
      double random = Random().nextDouble() * weight;
      Item rewardItem = _getBannerItem(banner, random);
      int searchValue = userItems
          .indexWhere((element) => element.assetName == rewardItem.assetName);
      if (searchValue == -1) {
        userItems.add(rewardItem);
        rewards.add(
          RewardItem(
            displayName: rewardItem.displayName,
            imagePath: rewardItem.imagePath,
          ),
        );
      } else {
        userStats.currency += banner.cost * 1.25;
        rewards.add(
          RewardItem(
            displayName: (banner.cost * 1.25).toStringAsFixed(2),
            imagePath: RewardItem.coinImage,
          ),
        );
      }
    }

    await _userApi.updateUserItems(userItems);
    await _userApi.updateUserStats(userStats);

    return rewards;
  }

  Item _getBannerItem(ItemBanner banner, double random) {
    double itemProgress = 0;
    int index = 0;
    while (random > itemProgress) {
      itemProgress += banner.items![index].appearRate;
      index++;
    }

    return banner.items![index - 1];
  }
}
