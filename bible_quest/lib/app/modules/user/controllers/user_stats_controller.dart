import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/app/modules/user/utils/user_grow.dart';
import 'package:get/get.dart';

class UserStatsController extends GetxController with StateMixin<Stats> {
  final UserProvider _apiService = UserProvider();

  late Stats userStats;

  @override
  onInit() {
    _fetchUserInfo();
    super.onInit();
  }

  _fetchUserInfo() async {
    try {
      userStats = await _apiService.getUserStats();
      change(userStats, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future levelUp(Future<dynamic> Function() onLevelUp) async {
    await onLevelUp();
    var userExperience = userStats.experience;
    var userHealth = userStats.health;

    userExperience.current = 0;
    userExperience.total = UserGrow.nextLevel(userStats.level);
    userStats.level++;
    userHealth.total =
        userHealth.current = UserGrow.nextHealth(userStats.level);
  }

  Future<Map<String, dynamic>> chapterReward({
    required Future<dynamic> Function() onLevelUp,
  }) async {
    int lv = userStats.level;
    double moneyEarned = UserGrow.getMoney(lv);
    int xpEarned = UserGrow.getXP(lv);

    var userExperience = userStats.experience;

    userExperience.current += xpEarned;
    userStats.currency += moneyEarned;

    if (userExperience.current >= userExperience.total)
      await this.levelUp(onLevelUp);

    _apiService.updateUserStats(
      userStats,
    );

    return {
      'money': moneyEarned,
      'xp': xpEarned,
    };
  }
}
