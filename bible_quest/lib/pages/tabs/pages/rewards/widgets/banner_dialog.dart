import 'package:bible_quest/bloc/store/store.dart';
import 'package:bible_quest/bloc/user/user.dart';
import 'package:bible_quest/models/items/item_exports.dart';
import 'package:bible_quest/pages/tabs/pages/user/widgets/section/sprite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<List<RewardItem>> bannerDialog(ItemBanner banner) async {
  List<RewardItem> rewards = List.empty(growable: true);
  final userCurrency = Get.find<UserController>().user.stats.currency;
  await Get.dialog(
    AlertDialog(
      title: Text(banner.title, style: Get.textTheme.headline5),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 150,
            width: 300,
            child: ListView(
              shrinkWrap: true,
              children: banner.items
                  .map((item) => Container(
                        padding: EdgeInsets.all(8),
                        child: Text(item.displayName),
                      ))
                  .toList(),
            ),
          ),
          Container(
            child: Text("¿Comprar de este paquete?"),
          ),
        ],
      ),
      actions: [
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
                      rewards =
                          await Get.find<StoreController>().buyItem(banner, 1);
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
                      rewards =
                          await Get.find<StoreController>().buyItem(banner, 6);
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
    barrierDismissible: true,
  );
  return rewards;
}

rewardedItemsDialog(List<RewardItem> items) {
  Get.dialog(
    AlertDialog(
      title: Text("Felicidades recibiste los siguientes objetos"),
      content: Wrap(
        children: items
            .map(
              (item) => SpriteCard(
                spritePath: item.imagePath,
                title: item.displayName,
              ),
            )
            .toList(),
      ),
    ),
  );
}
