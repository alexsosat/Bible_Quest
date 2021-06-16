import 'package:bible_quest/pages/mains/home/home.dart';
import 'package:bible_quest/pages/mains/missions/missions.dart';
import 'package:bible_quest/pages/mains/plans/plans.dart';
import 'package:bible_quest/pages/mains/social/social.dart';
import 'package:bible_quest/pages/mains/summons/summons.dart';
import 'package:bible_quest/pages/tabs/widgets/appbar/appbar.dart';
import 'package:bible_quest/pages/tabs/widgets/tab_icons_icons.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    HomePage(),
    MissionsPage(),
    PlansPage(),
    SummonsPage(),
    SocialPage()
  ];

  void _onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BibleQuestAppBar(),
      drawer: Drawer(),
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
          color: Theme.of(context).cardColor,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            elevation: 0,
            onTap: _onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(TabIcons.home), label: "Home"),
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
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(TabIcons.summons), label: "Task"),
              BottomNavigationBarItem(
                  icon: Icon(TabIcons.social), label: "Task"),
            ],
          ),
        ),
      ),
    );
  }
}
