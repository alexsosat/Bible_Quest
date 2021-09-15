import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsUserLoggedIn extends GetMiddleware {
  RouteSettings? redirecTo;

  @override
  RouteSettings? redirect(String? route) {
    return Get.find<AuthenticationController>().isAuthenticated
        ? RouteSettings(
            name: Routes.TABS,
          )
        : null;
  }
}
