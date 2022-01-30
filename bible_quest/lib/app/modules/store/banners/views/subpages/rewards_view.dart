import 'package:bible_quest/app/modules/store/banners/controllers/banner_controller.dart';
import 'package:bible_quest/app/modules/store/banners/models/item_banner.dart';
import 'package:bible_quest/app/modules/store/banners/models/reward_item.dart';
import 'package:bible_quest/globals/cards/sprite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';

class RewardsView extends StatefulWidget {
  final int rewardCount;
  final ItemBanner banner;
  const RewardsView({
    Key? key,
    required this.rewardCount,
    required this.banner,
  }) : super(key: key);

  @override
  _RewardsViewState createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Felicidades recibiste los siguientes objetos",
              textAlign: TextAlign.center,
              style: Get.textTheme.headline4,
            ),
            SizedBox(height: 20),
            _rewardItems(),
            SizedBox(height: 20),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Row _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: Text("Volver atrás"),
        ),
        ElevatedButton(
          onPressed: () => Get.off(
            () => RewardsView(
              banner: widget.banner,
              rewardCount: widget.rewardCount,
            ),
            transition: Transition.rightToLeft,
            preventDuplicates: false,
          ),
          child: Text("Abrir otro paquete"),
        )
      ],
    );
  }

  FutureBuilder<List<RewardItem>> _rewardItems() {
    return FutureBuilder<List<RewardItem>>(
        future: Get.find<BannerController>().buyItem(
          widget.banner,
          widget.rewardCount,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> items = List.empty(growable: true);
            for (int i = 0; i < snapshot.data!.length; i++) {
              items.add(
                Spring.scale(
                  start: 0.0,
                  end: 1.0,
                  delay: Duration(milliseconds: 300 * i),
                  curve: Curves.bounceOut,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: SpriteCard(
                      spritePath: snapshot.data![i].imagePath,
                      title: snapshot.data![i].displayName,
                    ),
                  ),
                ),
              );
            }
            return Wrap(children: items);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
