import 'dart:math';

import 'package:bible_quest/api/bible/fetch_bible.dart';
import 'package:bible_quest/models/bible/sections.dart';
import 'package:bible_quest/models/bible/bible.dart';
import 'package:bible_quest/pages/mains/plans/widgets/chapter_tile.dart';
import 'package:bible_quest/pages/mains/plans/widgets/plan_tile.dart';
import 'package:flutter/material.dart';

import '../abstract_model.dart';

class PlansController extends ControllerTemplate {
  PlansController({required this.section});

  var section = BibleSections.main;
  Bible bible = Bible.instance();

  var content = List<Widget>.empty(growable: true);

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

    content = <PlanTile>[
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
          testament = BibleTestaments.nt;
          fetchBooks();
        },
      ),
    ];
  }

  void fetchBooks() {
    content = List<Widget>.empty(growable: true);
    int startIndex = 0;
    int endIndex = 0;
    switch (testament!) {
      case BibleTestaments.at:
        startIndex = 0;
        endIndex = 38;
        break;

      case BibleTestaments.nt:
        startIndex = 39;
        endIndex = bible.books.length;
        break;
    }

    for (int i = startIndex; i < endIndex; i++) {
      content.add(PlanTile(
        title: bible.books[i].name,
        readedBooks: Random().nextInt(bible.books[i].chapters.length),
        totalBooks: bible.books[i].chapters.length,
        onPressed: () {
          section = BibleSections.chapters;
          fetchChapters(i);
        },
      ));
    }

    update();
  }

  void fetchChapters(int bibleIndex) {
    content = List<Widget>.empty(growable: true);

    for (int i = 0; i < bible.books[bibleIndex].chapters.length; i++) {
      content.add(
        ChapterTile(
            title: bible.books[bibleIndex].name +
                " " +
                bible.books[bibleIndex].chapters[i].number,
            readed: Random().nextBool(),
            onPressed: () {
              print(
                "going to " +
                    bible.books[bibleIndex].name +
                    " " +
                    bible.books[bibleIndex].chapters[i].number,
              );
            }),
      );
    }
    update();
  }
}
