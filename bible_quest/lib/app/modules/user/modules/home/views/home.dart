import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:bible_quest/app/modules/user/modules/home/controllers/home_controller.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/widgets/home_appbar.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/widgets/header/user_header_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/current_reading_box.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: HomeAppbar(),
      ),
      body: GetX<HomeController>(
        builder: (controller) {
          if (controller.errorOcurred.value &&
              controller.callErrorException != null) {
            return controller.internetPage(controller.callErrorException!);
          }
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              UserHeaderLayout(),
              ContinueReadingBox(),
            ],
          );
        },
      ),
    );
  }
}
