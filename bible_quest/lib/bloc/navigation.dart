import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final List<Widget> tabs;
  final TickerProvider ticker;
  NavigationController({required this.tabs, required this.ticker});

  late TabController tabController;

  var selectedIndex = 0.obs;

  List<Widget> mainTabs = [];
  // one buildContext for each tab to store history  of navigation
  late List<BuildContext?> navStack;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: ticker);
    navStack = []..length = tabs.length;
    for (int i = 0; i < tabs.length; i++) {
      mainTabs.add(
        Navigator(onGenerateRoute: (RouteSettings settings) {
          return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
            navStack[i] = context;
            return tabs[i];
          });
        }),
      );
    }
    super.onInit();
  }

  /// * Mehod that changes to the selected page in the bottomNavigation
  changeStatus(int selectIndex, tabIndex) {
    if (tabIndex != null) {
      tabController.animateTo(tabIndex);
    }
    selectedIndex(selectIndex);
  }

  /// * Mehod that evaluates the status of the page and realize an action based on
  /// * a set of condition
  void onItemTapped(int index) {
    /// return to the main page if the users selects the selectedPage and is in a
    /// subpage of that page
    if (index == selectedIndex.value) {
      if (Navigator.of(navStack[tabController.index]!).canPop()) {
        Navigator.of(navStack[tabController.index]!).pop();
      }
    }
    changeStatus(index, index);
  }

  /// * Mehod used to navigate to a subpage inside a tab Page
  void goToSubTabView(Widget widget, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }
}
