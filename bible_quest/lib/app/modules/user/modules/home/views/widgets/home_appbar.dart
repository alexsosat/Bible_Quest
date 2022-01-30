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
      ),
      onLoading: Container(),
    );
  }
}
