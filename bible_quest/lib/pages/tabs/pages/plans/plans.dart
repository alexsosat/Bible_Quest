import 'package:bible_quest/bloc/navigation.dart';
import 'package:bible_quest/bloc/bible/plan.dart';
import 'package:bible_quest/globals/layout/buider_page.dart';
import 'package:bible_quest/models/bible/indexes/sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'subpages/read.dart';
import 'widgets/chapter_tile.dart';
import 'widgets/plan_tile.dart';

class PlansPage extends StatelessWidget {
  final int? bibleIndex;
  final BibleSections section;
  final BibleTestaments? testament;

  const PlansPage({
    Key? key,
    required this.section,
    this.bibleIndex,
    this.testament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuilderPage<PlansController>(
      controller: PlansController(),
      horizontalPadding: 20.0,
      children: (controller) => _sectionsContent(
        context,
      ),
    );
  }

  List<Widget> _sectionsContent(
    BuildContext context,
  ) {
    final _ = Get.find<PlansController>();
    switch (section) {
      case BibleSections.main:
        return [
          PlanTile(
            title: "Antiguo Testamento",
            totalBooks: 12,
            readedBooks: 1,
            onPressed: () {
              Get.find<NavigationController>().goToSubTabView(
                  PlansPage(
                    section: BibleSections.books,
                    testament: BibleTestaments.at,
                  ),
                  context);
            },
          ),
          PlanTile(
            title: "Nuevo Testamento",
            totalBooks: 24,
            readedBooks: 2,
            onPressed: () {
              Get.find<NavigationController>().goToSubTabView(
                  PlansPage(
                    section: BibleSections.books,
                    testament: BibleTestaments.nt,
                  ),
                  context);
            },
          ),
        ];
      case BibleSections.books:
        List<Widget> content = List<Widget>.empty(growable: true);
        int startIndex = 0;
        int endIndex = 0;
        switch (testament!) {
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
              Get.find<NavigationController>().goToSubTabView(
                  PlansPage(
                    section: BibleSections.chapters,
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
