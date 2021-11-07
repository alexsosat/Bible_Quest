import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/app/modules/navigation/models/drawer_item.dart';
import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:bible_quest/app/modules/navigation/views/widgets/drawer_section.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:bible_quest/globals/tab_icons_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'drawer_header/drawer_header_section.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final controller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Get.theme.scaffoldBackgroundColor,
      ),
      child: Drawer(
        child: Column(
          children: [
            DrawerHeaderSection(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Inicio"),
                    onTap: () {
                      Navigator.of(context).pop();
                      controller.activeView.value = DrawerViews.home;
                    },
                  ),
                  DrawerSection(
                    sectionTitle: "Actividades",
                    children: [
                      DrawerItem(
                        icon: TabIcons.read,
                        title: "Lecturas",
                        view: DrawerViews.lectures,
                      ),
                      DrawerItem(
                        icon: TabIcons.games,
                        title: "Juegos",
                        view: DrawerViews.games,
                      ),
                    ],
                  ),
                  DrawerSection(
                    sectionTitle: "Tienda",
                    children: [
                      DrawerItem(
                        icon: TabIcons.summons,
                        title: "Banners",
                        view: DrawerViews.banners,
                      ),
                      DrawerItem(
                        icon: FontAwesomeIcons.exchangeAlt,
                        title: "Intercambios",
                        view: DrawerViews.exchange_store,
                      ),
                    ],
                  ),
                  DrawerSection(
                    sectionTitle: "Usuario",
                    children: [
                      DrawerItem(
                        icon: FontAwesomeIcons.tshirt,
                        title: "Personalizar",
                        view: DrawerViews.equipment,
                      ),
                      DrawerItem(
                        icon: TabIcons.tasks,
                        title: "Misiones",
                        view: DrawerViews.missions,
                      ),
                      DrawerItem(
                        icon: Icons.emoji_events,
                        title: "Logros",
                        view: DrawerViews.achievements,
                      ),
                    ],
                  ),
                  DrawerSection(
                    sectionTitle: "Usuario",
                    children: [
                      DrawerItem(
                        icon: Icons.new_releases,
                        title: "Noticias",
                        view: DrawerViews.news,
                      ),
                      DrawerItem(
                        icon: Icons.info,
                        title: "Acerca de",
                        view: DrawerViews.about,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text("Cerrar Sesión"),
                    onTap: () async {
                      Navigator.of(context).pop();
                      await FirebaseAuth.instance.signOut();
                      Get.offAllNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
