import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeAppbar extends GetView<UserInfoController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (user) => AppBar(
        title: Text(
          "Welcome ${user!.username}",
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onLoading: Container(),
      onError: (e) => Container(),
    );
  }
}
