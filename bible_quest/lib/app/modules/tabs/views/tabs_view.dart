import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabs"),
      ),
      body: Center(
        child: Text("Hola mundo"),
      ),
    );
  }
}




// import 'dart:ui';

// import 'package:bible_quest/app/modules/banners/views/banners_view.dart';
// import 'package:bible_quest/app/modules/lectures/models/bible/bible_exports.dart';
// import 'package:bible_quest/app/modules/lectures/views/lectures_view.dart';
// import 'package:bible_quest/app/modules/tabs/controllers/tabs_controller.dart';
// import 'package:bible_quest/app/modules/user/views/home/home.dart';
// import 'package:bible_quest/app/modules/user/views/missions/missions.dart';
// import 'package:bible_quest/app/modules/user/views/overview/user.dart';
// import 'package:bible_quest/globals/tab_icons_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TabsView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _TabsViewState();
// }

// class _TabsViewState extends State<TabsView>
//     with SingleTickerProviderStateMixin {
//   final List<Widget> widgetsChildren = [
//     HomePage(),
//     MissionsPage(),
//     LecturesView(section: BibleSections.main),
//     BannersView(),
//     UserPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(),
//       body: GetX<TabsController>(
//           init: TabsController(
//             tabs: widgetsChildren,
//             ticker: this,
//           ),
//           builder: (_) {
//             return WillPopScope(
//               child: Stack(
//                 children: [
//                   TabBarView(
//                     controller: _.tabController,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: _.mainTabs,
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: <Widget>[
//                         ClipRRect(
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(35)),
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
//                             child: BottomNavigationBar(
//                               backgroundColor: Theme.of(context)
//                                   .scaffoldBackgroundColor
//                                   .withOpacity(0.5),
//                               iconSize: 30,
//                               type: BottomNavigationBarType.fixed,
//                               showSelectedLabels: false,
//                               showUnselectedLabels: false,
//                               selectedItemColor: Colors.white,
//                               unselectedItemColor:
//                                   Colors.white.withOpacity(0.5),
//                               elevation: 0,
//                               onTap: _.onItemTapped,
//                               currentIndex: _.selectedIndex.value,
//                               items: [
//                                 BottomNavigationBarItem(
//                                     icon: Icon(TabIcons.home), label: "Home"),
//                                 BottomNavigationBarItem(
//                                     icon: Icon(TabIcons.tasks), label: "Task"),
//                                 BottomNavigationBarItem(
//                                     icon: Container(
//                                       decoration: BoxDecoration(
//                                           color: Theme.of(context).primaryColor,
//                                           shape: BoxShape.circle),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Icon(
//                                           TabIcons.read,
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .secondary,
//                                         ),
//                                       ),
//                                     ),
//                                     label: "Plans"),
//                                 BottomNavigationBarItem(
//                                     icon: Icon(TabIcons.summons),
//                                     label: "Summons"),
//                                 BottomNavigationBarItem(
//                                     icon: Icon(Icons.person, size: 34),
//                                     label: "Games"),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               onWillPop: () async {
//                 if (Navigator.of(_.navStack[_.tabController.index]!).canPop()) {
//                   Navigator.of(_.navStack[_.tabController.index]!).pop();
//                   _.changeStatus(_.tabController.index, null);
//                   return false;
//                 } else {
//                   if (_.tabController.index == 0) {
//                     _.changeStatus(_.tabController.index, 0);
//                     return true;
//                   } else {
//                     _.onItemTapped(0);
//                     return false;
//                   }
//                 }
//               },
//             );
//           }),
//     );
//   }
// }
