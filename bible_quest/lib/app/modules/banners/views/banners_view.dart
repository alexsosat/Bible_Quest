import 'package:bible_quest/globals/layout/buider_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/banners_controller.dart';
import 'widgets/card_reward_item.dart';

class BannersView extends GetView<BannersController> {
  @override
  Widget build(BuildContext context) {
    return BuilderPage<BannersController>(
      controller: BannersController(),
      children: (controller) => <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Text("Tienda", style: Theme.of(context).textTheme.headline5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: controller.banners
                .where((banner) {
                  final currentTime = DateTime.now();
                  return currentTime.isAfter(banner.startDate) &&
                      currentTime.isBefore(banner.endDate);
                })
                .map(
                  (element) => CardRewardItem(
                    banner: element,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
