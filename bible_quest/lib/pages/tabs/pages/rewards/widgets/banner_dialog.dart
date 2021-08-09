import 'package:bible_quest/models/items/item_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bannerDialog(ItemBanner banner) {
  Get.dialog(
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
            TextButton(
              onPressed: () => Get.back(),
              child: Text('1 item'),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 153, 255, 1.0),
                primary: Colors.white,
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
                  child: Text("${banner.cost * 10}"),
                )
              ],
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text('11 items'),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(204, 97, 255, 1.0),
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
    barrierDismissible: true,
  );
}
