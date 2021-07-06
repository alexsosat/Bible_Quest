import 'dart:ui';

import 'package:bible_quest/bloc/navigation.dart';
import 'package:bible_quest/models/bible/sections.dart';
import 'package:bible_quest/pages/mains/home/home.dart';
import 'package:bible_quest/pages/mains/missions/missions.dart';
import 'package:bible_quest/pages/mains/plans/plans.dart';
import 'package:bible_quest/pages/mains/social/social.dart';
import 'package:bible_quest/pages/mains/rewards/rewards.dart';
import 'package:bible_quest/pages/tabs/widgets/appbar/appbar.dart';
import 'package:bible_quest/pages/tabs/widgets/tab_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> widgetsChildren = [
    HomePage(),
    MissionsPage(),
    PlansPage(),
    RewardsPage(),
    SocialPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: BibleQuestAppBar(),
      drawer: Drawer(),
      body: GetX<NavigationController>(
          init: NavigationController(
            tabs: widgetsChildren,
            ticker: this,
          ),
          builder: (_) {
            return Stack(
              children: [
                TabBarView(
                  controller: _.tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: _.mainTabs,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: BibleQuestAppBar(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(35)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: BottomNavigationBar(
                              backgroundColor: Colors.transparent,
                              iconSize: 30,
                              type: BottomNavigationBarType.fixed,
                              showSelectedLabels: false,
                              showUnselectedLabels: false,
                              selectedItemColor: Colors.white,
                              unselectedItemColor:
                                  Colors.white.withOpacity(0.5),
                              elevation: 0,
                              onTap: _.onItemTapped,
                              currentIndex: _.selectedIndex.value,
                              items: [
                                BottomNavigationBarItem(
                                    icon: Icon(TabIcons.home), label: "Home"),
                                BottomNavigationBarItem(
                                    icon: Icon(TabIcons.tasks), label: "Task"),
                                BottomNavigationBarItem(
                                    icon: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Icon(
                                          TabIcons.read,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                    ),
                                    label: "Plans"),
                                BottomNavigationBarItem(
                                    icon: Icon(TabIcons.summons),
                                    label: "Summons"),
                                BottomNavigationBarItem(
                                    icon: Icon(TabIcons.games, size: 34),
                                    label: "Games"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
