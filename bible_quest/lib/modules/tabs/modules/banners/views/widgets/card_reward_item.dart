import 'package:bible_quest/modules/tabs/controllers/navigation.dart';
import 'package:bible_quest/globals/cards/card_center_item.dart';
import 'package:bible_quest/modules/tabs/modules/banners/models/item_banner.dart';
import 'package:bible_quest/modules/tabs/modules/banners/views/subpages/banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardRewardItem extends StatelessWidget {
  final ItemBanner banner;
  const CardRewardItem({
    Key? key,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CardItem(
        height: 135,
        width: double.maxFinite,
        radiusSpread: 2,
        centerItem: Image.asset(
          "assets/images/sprites/miscellaneous/tile000.png", //TODO: search for better images
          fit: BoxFit.contain,
          height: 50,
        ),
        title: Text(
          banner.title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          Get.find<NavigationController>().goToSubTabView(
            BannerPage(banner: banner),
            context,
          );
          // final reward = await bannerDialog(banner);

          // if (reward.isNotEmpty) rewardedItemsDialog(reward);
        },
      ),
    );
  }
}
