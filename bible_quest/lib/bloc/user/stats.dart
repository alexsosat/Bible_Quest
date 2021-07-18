import 'package:bible_quest/api/user/fetch_stats.dart';
import 'package:bible_quest/models/user/stats/stats.dart';
import 'package:get/get.dart';

import '../abstract_model.dart';

class UserStatsController extends ControllerTemplate {
  var content = UserStats.instance().obs;

  @override
  onInit() {
    fetchStats();
    super.onInit();
  }

  @override
  refreshContent() {
    fetchStats();
    super.refreshContent();
  }

  void fetchStats() async {
    try {
      isLoading(true);
      var response = UserStatsService().getUserStats();
      content(response);
    } finally {
      isLoading(false);
    }
  }
}
