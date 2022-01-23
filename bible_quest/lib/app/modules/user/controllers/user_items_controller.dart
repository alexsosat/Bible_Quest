import 'package:bible_quest/app/modules/store/banners/models/item.dart';
import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class UserItemsController extends GetxController with StateMixin<List<Item>> {
  final UserProvider _apiService = UserProvider();
  EquipmentSectionPage page;

  UserItemsController(this.page);

  @override
  onInit() {
    _fetchUserItems();
    super.onInit();
  }

  _fetchUserItems() async {
    try {
      List<Item> userAcquiredItems =
          await _apiService.getUserItemsByCategory(page);
      userAcquiredItems = addStarterItems(userAcquiredItems, page);

      if (userAcquiredItems.isEmpty)
        change(null, status: RxStatus.empty());
      else
        change(userAcquiredItems, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  List<Item> addStarterItems(
      List<Item> userAcquiredItems, EquipmentSectionPage page) {
    switch (page) {
      case EquipmentSectionPage.head:
        return [...userAcquiredItems, ...StartItems.heads];

      case EquipmentSectionPage.base:
        return [...userAcquiredItems, ...StartItems.base];

      case EquipmentSectionPage.body:
        return [...userAcquiredItems, ...StartItems.bodies];

      default:
        return userAcquiredItems;
    }
  }
}
