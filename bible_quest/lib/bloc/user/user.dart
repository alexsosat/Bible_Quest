import 'dart:math';
import 'package:get/get.dart';

import 'package:bible_quest/api/user/fetch_user.dart';
import 'package:bible_quest/models/items/item_exports.dart';
import 'package:bible_quest/models/user/user.dart';

import '../abstract_model.dart';

class UserController extends ControllerTemplate {
  var content = User.instance().obs;

  final UserService apiService = UserService();
  final _UserGrow userGrow = _UserGrow();

  @override
  onInit() {
    fetchUser();
    super.onInit();
  }

  @override
  refreshContent() {
    fetchUser();
    super.refreshContent();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var response = await apiService.getUser();
      content(response);
    } finally {
      isLoading(false);
      update();
    }
  }

  User get user => content.value;

  Future updateUser(Map<String, dynamic> content) async {
    await apiService.updateUser(content);
    update();
  }

  Future<Map<String, dynamic>> chapterReward(
      {required Future<dynamic> Function() onLevelUp}) async {
    int lv = user.stats.level;
    double moneyEarned = userGrow.getMoney(lv);
    int xpEarned = userGrow.getXP(lv);

    var userExperience = user.stats.experience;

    userExperience.current += xpEarned;
    user.stats.currency += moneyEarned;

    if (userExperience.current >= userExperience.total)
      await this.levelUp(onLevelUp);

    updateUser({
      "currency": moneyEarned,
      "level": user.stats.level,
      "experience": userExperience.toJson(),
      "health": userExperience.toJson(),
    });

    return {
      'money': moneyEarned,
      'xp': xpEarned,
    };
  }

  Future levelUp(Future<dynamic> Function() onLevelUp) async {
    await onLevelUp();
    var userExperience = user.stats.experience;
    var userHealth = user.stats.health;

    userExperience.current = 0;
    userExperience.total = userGrow.nextLevel(user.stats.level);
    user.stats.level++;
    userHealth.total =
        userHealth.current = userGrow.nextHealth(user.stats.level);
  }

  Future changeGear(ItemCategory key, String itemId) async {
    Map<String, dynamic> json = user.currentItems.toJson();
    String jsonKey = ItemCategoryHelpers.categoryToString(key);

    json[jsonKey] = itemId;

    user.currentItems = CurrentItems.fromJson(json);

    await updateUser({"current_items": json});
  }
}

class _UserGrow {
  /// Returns the next total XP required after leveling up
  int nextLevel(int level) {
    double n = 0.04 * (level ^ 3) + 0.8 * (level ^ 2) + 2 * level;
    return n.round();
  }

  ///Returns the amount of XP received per lecture
  int getXP(int lvl) {
    double xp = sqrt(lvl) + 2;
    return xp.ceil();
  }

  /// Returns the amount of total Health after leveling up
  int nextHealth(int lvl) {
    double n = 6 * sqrt(lvl) + 3;
    return n.ceil();
  }

  /// Returns the amount of money gained per lecture
  double getMoney(int lvl) {
    double xp = (1.5 * sin(lvl)) + 3;
    xp = xp.floor().toDouble();
    return xp;
  }
}
