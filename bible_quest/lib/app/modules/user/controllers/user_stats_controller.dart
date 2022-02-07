import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/app/modules/user/utils/user_grow.dart';
import 'package:bible_quest/globals/controllers/api_controller_template.dart';
import 'package:get/get.dart';

class UserStatsController extends ApiControllerTemplate<Stats> {
  final UserProvider _apiService = UserProvider();

  @override
  Future loadData() async {
    change(null, status: RxStatus.loading());
    await call<Stats>(
      httpCall: () => _apiService.getUserStats(),
      onSuccess: (stats) {
        change(stats, status: RxStatus.success());
      },
      onCallError: (error) => throw error,
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );
  }

  Future levelUp(Future<dynamic> Function() onLevelUp) async {
    await onLevelUp();
    var userExperience = data.experience;
    var userHealth = data.health;

    userExperience.current = 0;
    userExperience.total = UserGrow.nextLevel(data.level);
    data.level++;
    userHealth.total = userHealth.current = UserGrow.nextHealth(data.level);
  }

  Future<Map<String, dynamic>> chapterReward({
    required Future<dynamic> Function() onLevelUp,
  }) async {
    int lv = data.level;
    double moneyEarned = UserGrow.getMoney(lv);
    int xpEarned = UserGrow.getXP(lv);

    var userExperience = data.experience;

    userExperience.current += xpEarned;
    data.currency += moneyEarned;

    if (userExperience.current >= userExperience.total)
      await this.levelUp(onLevelUp);

    _apiService.updateUserStats(
      data,
    );

    return {
      'money': moneyEarned,
      'xp': xpEarned,
    };
  }
}
