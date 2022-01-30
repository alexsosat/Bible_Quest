import 'package:bible_quest/app/modules/activities/lectures/navigation/bindings/lectures_bindings.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/lectures_main_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/subpages/lectures_books_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/subpages/lectures_chapter_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/read/views/read_page.dart';
import 'package:bible_quest/app/modules/user/modules/create/bindings/create_user_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/create/views/create_user_view.dart';
import 'package:bible_quest/app/modules/user/modules/home/bindings/home_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/home.dart';
import 'package:get/get.dart';

import 'package:bible_quest/app/modules/login/bindings/login_binding.dart';
import 'package:bible_quest/app/modules/login/middlewares/is_user_logged_in.dart';
import 'package:bible_quest/app/modules/login/views/login_view.dart';

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
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LECTURES,
      page: () => LecturesView(),
      binding: LecturesBinding(),
    ),
    GetPage(
      name: _Paths.LECTURESBOOKS,
      page: () => LecturesBooksView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LECTURESCHAPTERS,
      page: () => LecturesChaptersView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LECTURESREAD,
      page: () => ReadPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => CreateUserView(),
      binding: CreateUserBindings(),
    ),
  ];
}
