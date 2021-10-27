import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeAppbar extends GetView<UserInfoController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (user) => AppBar(
        title: Text("Welcome ${user!.username}"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.find<NavigationController>()
              .drawerKey
              .currentState!
              .openDrawer(),
          icon: Icon(
            Icons.menu,
          ),
        ),
      ),
      onLoading: Container(),
    );
  }
}
