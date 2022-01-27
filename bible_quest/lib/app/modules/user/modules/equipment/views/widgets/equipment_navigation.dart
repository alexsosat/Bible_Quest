import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/widgets/equipment_change.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/views/widgets/equipment_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class EquipmentSection extends StatefulWidget {
  @override
  State<EquipmentSection> createState() => _EquipmentSectionState();
}

class _EquipmentSectionState extends State<EquipmentSection> {
  EquipmentSectionPage section = EquipmentSectionPage.menu;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (section != EquipmentSectionPage.menu) {
          setState(() {
            section = EquipmentSectionPage.menu;
          });
        } else {
          Get.find<NavigationController>().drawerKey.currentState!.openDrawer();
        }
        return false;
      },
      child: _displayEquipmentSection(),
    );
  }

  Widget _displayEquipmentSection() {
    switch (section) {
      case EquipmentSectionPage.menu:
        return EquipmentMenu(
          onSelect: (page) {
            setState(() {
              section = page;
            });
          },
        );
      default:
        return EquipmentChange(
          section: section,
          onReturn: () {
            setState(() {
              section = EquipmentSectionPage.menu;
            });
          },
        );
    }
  }
}
