import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsUserLoggedIn extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool authenticated = Get.find<AuthenticationController>().isUserLoggedIn;
    return authenticated
        ? RouteSettings(
            name: Routes.HOME,
          )
        : null;
  }
}
