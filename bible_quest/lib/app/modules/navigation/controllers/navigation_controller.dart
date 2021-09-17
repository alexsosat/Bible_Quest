import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var active_view = DrawerViews.home.obs;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
  }
}
