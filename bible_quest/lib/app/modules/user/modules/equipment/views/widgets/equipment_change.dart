import 'package:bible_quest/app/modules/banners/models/categories.dart';
import 'package:bible_quest/app/modules/banners/models/item.dart';
import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/controllers/user_items_controller.dart';
import 'package:bible_quest/app/modules/user/models/current_items.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentChange extends StatelessWidget {
  final Function() onReturn;
  final EquipmentSectionPage section;
  const EquipmentChange({
    Key? key,
    required this.onReturn,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            IconButton(onPressed: onReturn, icon: Icon(Icons.chevron_left)),
          ],
        ),
        GetBuilder<UserItemsController>(
          init: UserItemsController(section),
          builder: (controller) => controller.obx(
            (state) => Column(
              children: state!
                  .map(
                    (item) => TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: Colors.white,
                      ),
                      onPressed: () async {
                        var userInfoController = Get.find<UserInfoController>();
                        CurrentItems newItems =
                            userInfoController.userInfo.currentItems;
                        newItems = changeEquipment(
                          item.type,
                          userInfoController.userInfo.currentItems,
                          item,
                        );
                        await userInfoController.updateUserItems(newItems);
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            ListTile(
                              leading: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF151529),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(item.imagePath),
                                      fit: BoxFit.cover,
                                      alignment: getViewAlignment(),
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(item.displayName),
                              subtitle: Text(item.description),
                              // trailing: (userController.user.currentItems
                              //             .categoryToItem(widget.category) ==
                              //         element.assetName)
                              //     ? Icon(
                              //         Icons.check_circle,
                              //         color: Colors.green,
                              //       )
                              //     : null,
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
            onEmpty: Center(
              child: Text("No tienes objetos de esta categoría"),
            ),
          ),
        )
      ],
    );
  }

  CurrentItems changeEquipment(
      ItemCategory type, CurrentItems currentItems, Item item) {
    switch (type) {
      case ItemCategory.arm:
        currentItems.arm = item.assetName;
        break;
      case ItemCategory.background:
        currentItems.background = item.assetName;
        break;
      case ItemCategory.base:
        currentItems.base = item.assetName;
        break;
      case ItemCategory.body:
        currentItems.body = item.assetName;
        break;
      case ItemCategory.head:
        currentItems.head = item.assetName;
        break;
      case ItemCategory.pet:
        currentItems.pet = item.assetName;
        break;
    }

    return currentItems;
  }

  Alignment getViewAlignment() {
    switch (section) {
      case EquipmentSectionPage.head:
        return Alignment.topCenter;
      case EquipmentSectionPage.body:
        return Alignment.center;
      case EquipmentSectionPage.arm:
        return Alignment(0, 0.3);
      case EquipmentSectionPage.base:
        return Alignment.topCenter;
      default:
        return Alignment.center;
    }
  }
}
