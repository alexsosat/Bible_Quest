import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController with StateMixin {
  var activeView = DrawerViews.home.obs;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    checkUserExists();
    super.onInit();
  }

  void checkUserExists() async {
    bool userExists = await UserProvider().userExists();
    if (!userExists)
      Get.offAndToNamed(Routes.CREATE);
    else
      change(null, status: RxStatus.success());
  }
}
