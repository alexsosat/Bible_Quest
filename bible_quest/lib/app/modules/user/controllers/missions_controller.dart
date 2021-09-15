import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:bible_quest/globals/controller_template.dart';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

class MissionsController extends ControllerTemplate<User> {
  final controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  onInit() {
    fetchMissions();
    super.onInit();
  }

  void fetchMissions() async {
    try {
      // isLoading(true);
    } finally {
      // isLoading(false);
    }
  }

  void changeView(int pageIndex) async {
    currentPage = pageIndex;
    update();
    await controller.animateToPage(
      pageIndex,
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
    );
  }
}