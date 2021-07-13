import 'package:bible_quest/api/bible/fetch_bible.dart';
import 'package:bible_quest/models/bible/indexes/bible.dart';
import 'package:bible_quest/models/bible/indexes/sections.dart';

import '../abstract_model.dart';

class PlansController extends ControllerTemplate {
  PlansController();

  BibleSections section = BibleSections.main;
  Bible bible = Bible.instance();

  BibleTestaments? testament;

  @override
  void onInit() {
    fetchContent();
    super.onInit();
  }

  @override
  void refreshContent() {
    fetchContent();
    super.refreshContent();
  }

  void fetchContent() async {
    try {
      isLoading(true);
      await fetchPlans();
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchPlans() async {
    final response = await ApiBibleService().getBible();

    bible = response;
  }
}
