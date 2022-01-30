import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:bible_quest/app/modules/store/banners/controllers/banners_list_controller.dart';
import 'package:bible_quest/app/modules/store/banners/views/widgets/card_reward_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BannersListView extends GetView<BannersListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banners"),
      ),
      drawer: AppDrawer(),
      body: controller.obx(
        (banners) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: banners!
              .where((banner) {
                final currentTime = DateTime.now();
                return currentTime.isAfter(banner.startDate) &&
                    currentTime.isBefore(banner.endDate);
              })
              .map(
                (element) => BannerCard(
                  banner: element,
                ),
              )
              .toList(),
        ),
        onEmpty: Center(
          child: Text("Actualmente no existen banners disponibles"),
        ),
      ),
    );
  }
}
