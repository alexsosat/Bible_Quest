import 'package:bible_quest/api/bible/fetch_bible.dart';
import 'package:bible_quest/models/bible/sections.dart';
import 'package:bible_quest/models/bible/bible.dart';
import 'package:bible_quest/pages/mains/plans/widgets/round_plan_tile.dart';
import 'package:get/get.dart';

import '../abstract_model.dart';

class PlansController extends ControllerTemplate {
  PlansController({required this.section});

  var section = BibleSections.main;
  Bible bible = Bible.instance();

  var content = List<PlanTile>.empty(growable: true).obs;

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

  void fetchContent() {
    try {
      isLoading(true);
      switch (section) {
        case BibleSections.main:
          fetchPlans();
          break;

        case BibleSections.books:
          fetchBooks();
          break;

        case BibleSections.chapters:
          fetchChapters();
          break;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchPlans() async {
    final response = await ApiBibleService().getBible();
    bible = response;

    content(<PlanTile>[
      PlanTile(
        title: "Antiguo Testamento",
        totalBooks: 12,
        readedBooks: 1,
        onPressed: () {
          section = BibleSections.books;
          testament = BibleTestaments.at;
          fetchBooks();
        },
      ),
      PlanTile(
        title: "Nuevo Testamento",
        totalBooks: 24,
        readedBooks: 2,
        onPressed: () {
          section = BibleSections.books;
          testament = BibleTestaments.at;
          fetchBooks();
        },
      ),
    ]);
  }

  void fetchBooks() async {
    switch (testament!) {
      case BibleTestaments.at:
        // Todo: split the books by testaments Note: test what you have right now
        break;

      case BibleTestaments.nt:
        break;
    }
  }

  void fetchChapters() {}
}
