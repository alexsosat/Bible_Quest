import 'package:bible_quest/app/modules/user/modules/create/bindings/create_user_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/create/views/create_user_view.dart';
import 'package:get/get.dart';

import 'package:bible_quest/app/modules/login/bindings/login_binding.dart';
import 'package:bible_quest/app/modules/login/middlewares/is_user_logged_in.dart';
import 'package:bible_quest/app/modules/login/views/login_view.dart';
import 'package:bible_quest/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:bible_quest/app/modules/navigation/views/navigation_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [IsUserLoggedIn()],
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => CreateUserView(),
      binding: CreateUserBindings(),
    ),
  ];
}
