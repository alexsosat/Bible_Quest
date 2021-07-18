import 'package:bible_quest/models/user/stats/stats.dart';
import 'package:get_storage/get_storage.dart';

class UserStatsService {
  final storage = GetStorage();

  UserStats getUserStats() {
    Map<String, dynamic>? stats = storage.read('user_stats');
    if (stats == null) {
      stats = UserStats.initalStats();
      storage.write('user_stats', stats);
    }

    return UserStats.fromJson(stats);
  }
}
