import 'package:bible_quest/app/modules/activities/games/views/games_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/views/lectures_view.dart';
import 'package:bible_quest/app/modules/application/about/views/about_view.dart';
import 'package:bible_quest/app/modules/application/news/views/news_view.dart';
import 'package:bible_quest/app/modules/application/settings/views/settings_view.dart';
import 'package:bible_quest/app/modules/banners/views/banners_view.dart';
import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:bible_quest/app/modules/store/exchange/views/exchange_store_view.dart';
import 'package:bible_quest/app/modules/user/modules/achievements/views/achievements_view.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/user.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/home.dart';
import 'package:bible_quest/app/modules/user/modules/missions/views/missions.dart';
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
          builder: (_) {
            switch (_.activeView.value) {
              case DrawerViews.home:
                return HomeView();
              case DrawerViews.lectures:
                return LecturesView();
              case DrawerViews.games:
                return GamesView();
              case DrawerViews.banners:
                return BannersView();
              case DrawerViews.exchange_store:
                return ExchangeStoreView();
              case DrawerViews.equipment:
                return EquipmentView();
              case DrawerViews.missions:
                return MissionsView();
              case DrawerViews.achievements:
                return AchievementsView();
              case DrawerViews.news:
                return NewsView();
              case DrawerViews.settings:
                return SettingsView();
              case DrawerViews.about:
                return AboutView();
            }
          },
        ),
      ),
    );
  }
}
