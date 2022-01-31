import 'package:bible_quest/app/modules/store/banners/models/item_banner.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:bible_quest/globals/cards/card_center_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerCard extends StatelessWidget {
  final ItemBanner banner;
  const BannerCard({
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
          "assets/images/sprites/miscellaneous/tile000.png",
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
          Get.toNamed(Routes.BANNER(banner.id.toString()));
        },
      ),
    );
  }
}