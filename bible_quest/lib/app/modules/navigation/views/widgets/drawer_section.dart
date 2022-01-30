import 'package:bible_quest/app/modules/navigation/models/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerSection extends StatelessWidget {
  final List<DrawerItem> children;
  final String sectionTitle;
  const DrawerSection({
    Key? key,
    required this.sectionTitle,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).cardColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            sectionTitle,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...children
            .map(
              (item) => ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.toNamed(item.view);
                },
              ),
            )
            .toList()
      ],
    );
  }
}
