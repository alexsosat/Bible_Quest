import 'package:bible_quest/app/modules/banners/models/categories.dart';
import 'package:bible_quest/app/modules/user/models/current_items.dart';
import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<User> {
  final UserProvider apiService = UserProvider();

  User get user => state!;

  Stats get userStats => state!.stats;

  @override
  onInit() {
    fetchUser();
    super.onInit();
  }

  refreshContent() {
    fetchUser();
  }

  void fetchUser() async {
    try {
      var response = await apiService.getUserAll();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future updateUser(Map<String, dynamic> content) async {
    // await apiService.updateUser(
    //   Get.find<UserInfoController>().userInfo.id,
    //   content,
    // );
  }

  Future changeGear(ItemCategory key, String itemId) async {
    Map<String, dynamic> json = user.currentItems.toJson();
    String jsonKey = ItemCategoryHelpers.categoryToString(key);

    json[jsonKey] = itemId;

    user.currentItems = CurrentItems.fromJson(json);

    await updateUser({"current_items": json});
  }
}
