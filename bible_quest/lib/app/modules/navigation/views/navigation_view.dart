import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:bible_quest/app/modules/user/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import 'widgets/drawer.dart';

class NavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: GetBuilder<NavigationController>(
        builder: (_) {
          switch (_.active_view) {
            case DrawerViews.home:
              return HomeView();
          }
        },
      ),
    );
  }
}
