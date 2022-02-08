import 'package:bible_quest/app/modules/activities/games/views/games_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/bindings/lectures_bindings.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/lectures_main_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/subpages/lectures_books_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/subpages/lectures_chapter_view.dart';
import 'package:bible_quest/app/modules/activities/lectures/read/views/read_page.dart';
import 'package:bible_quest/app/modules/application/about/views/about_view.dart';
import 'package:bible_quest/app/modules/application/news/views/news_view.dart';
import 'package:bible_quest/app/modules/application/settings/views/settings_view.dart';
import 'package:bible_quest/app/modules/store/banners/bindings/banner_binding.dart';
import 'package:bible_quest/app/modules/store/banners/bindings/banners_list_binding.dart';
import 'package:bible_quest/app/modules/store/banners/views/banners_list_view.dart';
import 'package:bible_quest/app/modules/store/banners/views/subpages/banner_view.dart';
import 'package:bible_quest/app/modules/store/exchange/views/exchange_store_view.dart';
import 'package:bible_quest/app/modules/user/modules/achievements/views/achievements_view.dart';
import 'package:bible_quest/app/modules/user/modules/create/bindings/create_user_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/create/views/create_user_view.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/change_equipment_view.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/equipment_view.dart';
import 'package:bible_quest/app/modules/user/modules/home/bindings/home_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/home.dart';
import 'package:bible_quest/app/modules/user/modules/missions/bindings/missions_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/missions/views/missions.dart';
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
      page: () => ReadView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.GAMES,
      page: () => GamesView(),
    ),
    GetPage(
      name: _Paths.BANNERSLIST,
      page: () => BannersListView(),
      binding: BannersListBinding(),
    ),
    GetPage(
      name: _Paths.BANNER,
      page: () => BannerView(),
      binding: BannerBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.EXCHANGES,
      page: () => ExchangeStoreView(),
    ),
    GetPage(
      name: _Paths.EQUIPMENT,
      page: () => EquipmentView(),
    ),
    GetPage(
      name: _Paths.EQUIPMENTCHANGE,
      page: () => ChangeEquipmentView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.MISSIONS,
      page: () => MissionsView(),
      binding: MissionsBinding(),
    ),
    GetPage(
      name: _Paths.ACHIEVEMENTS,
      page: () => AchievementsView(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => CreateUserView(),
      binding: CreateUserBindings(),
    ),
  ];
}
