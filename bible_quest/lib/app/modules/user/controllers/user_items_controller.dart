import 'package:bible_quest/app/modules/store/banners/models/item.dart';
import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/globals/controllers/api_controller_template.dart';
import 'package:get/get.dart';

class UserItemsController extends ApiControllerTemplate<List<Item>> {
  final UserProvider _apiService = UserProvider();
  EquipmentSectionPage page;

  UserItemsController(this.page);

  @override
  Future loadData() async {
    change(null, status: RxStatus.loading());
    await call<List<Item>>(
      httpCall: () => _apiService.getUserItemsByCategory(page),
      onSuccess: (items) {
        items = addStarterItems(items, page);
        change(items, status: RxStatus.success());

        if (items.isEmpty)
          change(null, status: RxStatus.empty());
        else
          change(items, status: RxStatus.success());
      },
      onCallError: (error) => throw error,
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );
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
