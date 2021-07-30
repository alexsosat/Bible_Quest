import 'package:bible_quest/bloc/user/user.dart';
import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:bible_quest/models/items/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEquipment extends StatelessWidget {
  final List<Item> items;
  ChangeEquipment({Key? key, required this.items}) : super(key: key);

  final userController = Get.find<UserController>();

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
                      onPressed: () {},
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
                              trailing:
                                  (userController.user.currentItems.head ==
                                          element.imagePath)
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
