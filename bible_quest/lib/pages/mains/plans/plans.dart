import 'dart:math';

import 'package:bible_quest/bloc/navigation.dart';
import 'package:bible_quest/bloc/plans/plan.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/models/bible/indexes/sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'subpages/read.dart';
import 'widgets/chapter_tile.dart';
import 'widgets/plan_tile.dart';

class PlansPage extends StatelessWidget {
  final int? bibleIndex;
  const PlansPage({Key? key, this.bibleIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: GetBuilder<PlansController>(
            init: PlansController(),
            builder: (_) {
              if (_.isLoading.value)
                return Center(child: CircularProgressIndicator());
              return TabPage(
                children: _sectionsContent(_, context),
              );
            }),
      ),
    );
  }

  List<Widget> _sectionsContent(PlansController _, BuildContext context) {
    switch (_.section) {
      case BibleSections.main:
        return [
          PlanTile(
            title: "Antiguo Testamento",
            totalBooks: 12,
            readedBooks: 1,
            onPressed: () {
              _.section = BibleSections.books;
              _.testament = BibleTestaments.at;
              Get.find<NavigationController>()
                  .goToSubTabView(PlansPage(), context);
            },
          ),
          PlanTile(
            title: "Nuevo Testamento",
            totalBooks: 24,
            readedBooks: 2,
            onPressed: () {
              _.section = BibleSections.books;
              _.testament = BibleTestaments.nt;
              Get.find<NavigationController>()
                  .goToSubTabView(PlansPage(), context);
            },
          ),
        ];
      case BibleSections.books:
        List<Widget> content = List<Widget>.empty(growable: true);
        int startIndex = 0;
        int endIndex = 0;
        switch (_.testament!) {
          case BibleTestaments.at:
            startIndex = 0;
            endIndex = 38;
            break;

          case BibleTestaments.nt:
            startIndex = 39;
            endIndex = _.bible.books.length;
            break;
        }

        for (int i = startIndex; i < endIndex; i++) {
          content.add(PlanTile(
            title: _.bible.books[i].name,
            readedBooks: _.bible.books[i].readedChapters,
            totalBooks: _.bible.books[i].totalChapters,
            onPressed: () {
              _.section = BibleSections.chapters;
              Get.find<NavigationController>().goToSubTabView(
                  PlansPage(
                    bibleIndex: i,
                  ),
                  context);
            },
          ));
        }
        return content;

      case BibleSections.chapters:
        List<Widget> content = List<Widget>.empty(growable: true);

        for (int i = 0; i < _.bible.books[bibleIndex!].chapters.length; i++) {
          content.add(
            ChapterTile(
                title: _.bible.books[bibleIndex!].name +
                    " " +
                    _.bible.books[bibleIndex!].chapters[i].number,
                readed: _.bible.books[bibleIndex!].chapters[i].readed,
                onPressed: () {
                  Get.to(() => ReadPage(
                        chapterId: _.bible.books[bibleIndex!].chapters[i].id,
                      ));
                }),
          );
        }
        return content;
    }
  }
}
