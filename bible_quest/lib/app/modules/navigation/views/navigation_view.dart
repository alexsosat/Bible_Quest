import 'package:bible_quest/app/modules/activities/games/views/games_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/lectures_navigation_view.dart';
import 'package:bible_quest/app/modules/application/about/views/about_view.dart';
import 'package:bible_quest/app/modules/application/news/views/news_view.dart';
import 'package:bible_quest/app/modules/application/settings/views/settings_view.dart';
import 'package:bible_quest/app/modules/store/banners/views/banners_view.dart';
import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:bible_quest/app/modules/store/exchange/views/exchange_store_view.dart';
import 'package:bible_quest/app/modules/user/modules/achievements/views/achievements_view.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/equipment_view.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/home.dart';
import 'package:bible_quest/app/modules/user/modules/missions/views/missions.dart';
import 'package:bible_quest/globals/layout/navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import 'widgets/drawer.dart';

class NavigationView extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.drawerKey,
      drawer: AppDrawer(),
      body: controller.obx(
        (state) => GetX<NavigationController>(
          builder: (_) => NavigationBuilder<DrawerViews>(
            values: DrawerViews.values,
            currentValue: _.activeView.value,
            pages: <Widget>[
              HomeView(),
              LecturesView(),
              GamesView(),
              BannersView(),
              ExchangeStoreView(),
              EquipmentView(),
              MissionsView(),
              AchievementsView(),
              NewsView(),
              SettingsView(),
              AboutView(),
            ],
          ),
        ),
      ),
    );
  }
}
