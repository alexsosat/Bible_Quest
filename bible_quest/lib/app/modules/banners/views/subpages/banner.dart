import 'package:bible_quest/app/modules/banners/models/item_banner.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'rewards.dart';

class BannerPage extends StatelessWidget {
  final ItemBanner banner;
  BannerPage({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final userCurrency = Get.find<UserController>().user.stats.currency;

  @override
  Widget build(BuildContext context) {
    final String startDate =
        DateFormat('dd/MMMM/yyyy').format(banner.startDate);
    final String endDate = DateFormat('dd/MMMM/yyyy').format(banner.endDate);

    return Scaffold(
      body: TabPage(
        horizontalPadding: 20,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              banner.title,
              style: Get.textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "$startDate - $endDate",
              style: Get.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              banner.description,
              style: Get.textTheme.headline5,
            ),
          ),
          GridView.count(
            primary: false,
            padding: EdgeInsets.zero,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            childAspectRatio: 0.9,
            shrinkWrap: true,
            children: banner.items
                .map((item) => SpriteCard(
                      spritePath: item.imagePath,
                      title: item.displayName,
                    ))
                .toList(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.monetization_on, color: Colors.yellow),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(banner.cost.toString())),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: (userCurrency >= banner.cost)
                          ? () async {
                              Get.to(
                                () => RewardsPage(
                                  banner: banner,
                                  rewardCount: 1,
                                ),
                                transition: Transition.rightToLeft,
                              );
                            }
                          : null,
                      child: Text('1 item'),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color.fromRGBO(0, 153, 255, 1.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.monetization_on, color: Colors.yellow),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Text("${banner.cost * 5}"),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: (userCurrency >= (banner.cost * 5))
                          ? () async {
                              Get.to(
                                () => RewardsPage(
                                  banner: banner,
                                  rewardCount: 6,
                                ),
                                transition: Transition.rightToLeft,
                              );
                            }
                          : null,
                      child: Text('6 items'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(204, 97, 255, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
