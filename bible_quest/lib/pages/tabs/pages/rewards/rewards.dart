import 'package:bible_quest/bloc/store/store.dart';
import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/card_reward_item.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(children: <Widget>[
      Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Tienda", style: Theme.of(context).textTheme.headline5)),
      GetX<StoreController>(
          init: StoreController(),
          builder: (controller) {
            if (controller.isLoading.value)
              return Center(child: CircularProgressIndicator());
            return Padding(
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
            );
          })
    ]);
  }
}
