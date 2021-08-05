import 'package:bible_quest/bloc/user/user.dart';
import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:bible_quest/models/items/item_exports.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEquipment extends StatefulWidget {
  final ItemCategory category;
  ChangeEquipment({Key? key, required this.category}) : super(key: key);

  @override
  _ChangeEquipmentState createState() => _ChangeEquipmentState();
}

class _ChangeEquipmentState extends State<ChangeEquipment> {
  final userController = Get.find<UserController>();
  late final List<Item> items;

  @override
  void initState() {
    items = userController.user.itemsfromCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (items.length == 0)
          ? Center(
              child: Text("No tienes objetos de esta categoría"),
            )
          : TabPage(
              children: items
                  .map(
                    (element) => TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: Colors.white,
                      ),
                      onPressed: () async {
                        await userController.changeGear(
                            widget.category, element.assetName);
                        setState(() {});
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            ListTile(
                              //TODO: Center image in Tile
                              leading: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF151529),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Image.asset(
                                  element.imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              title: Text(element.displayName),
                              subtitle: Text(element.description),
                              trailing: (userController.user.currentItems
                                          .categoryToItem(widget.category) ==
                                      element.assetName)
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  : null,
                            ),
                            SizedBox(height: 10),
                            Divider(height: 0),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
