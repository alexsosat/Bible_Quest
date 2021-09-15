import 'package:bible_quest/app/modules/login/middlewares/is_user_logged_in.dart';
import 'package:get/get.dart';

import 'package:bible_quest/app/modules/login/bindings/login_binding.dart';
import 'package:bible_quest/app/modules/login/views/login_view.dart';
import 'package:bible_quest/app/modules/tabs/bindings/tabs_binding.dart';
import 'package:bible_quest/app/modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [IsUserLoggedIn()],
    ),
  ];
}
