import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LecturesView extends StatelessWidget {
  const LecturesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures"),
        leading: IconButton(
            onPressed: () => Get.find<NavigationController>()
                .drawerKey
                .currentState!
                .openDrawer(),
            icon: Icon(
              Icons.menu,
            )),
      ),
      body: Center(
        child: Text("Lectures body"),
      ),
    );
  }
}