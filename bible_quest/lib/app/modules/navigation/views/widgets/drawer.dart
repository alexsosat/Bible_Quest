import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/app/modules/navigation/models/views_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final controller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              height: 150,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Inicio"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.home;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Lecturas"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.lectures;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Juegos"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.games;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Banners"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.banners;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Intercambios"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.exchange_store;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Personalizar"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.equipment;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Misiones"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.missions;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Logros"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.achievements;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Noticias"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.news;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Configuración"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.settings;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Acerca de"),
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.active_view.value = DrawerViews.about;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
