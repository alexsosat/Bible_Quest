import 'dart:math';

import 'package:bible_quest/app/modules/activities/lectures/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/views/widgets/lectures_colors.dart';
import 'package:bible_quest/app/modules/activities/lectures/views/widgets/progress_card.dart';
import 'package:bible_quest/app/modules/lectures/views/subpages/read.dart';
import 'package:bible_quest/app/modules/lectures/views/widgets/chapter_tile.dart';
import 'package:bible_quest/app/modules/lectures/views/widgets/plan_tile.dart';
import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LecturesView extends GetView<LecturesController> {
  final int? bibleIndex;
  final PlanSections section;
  final BibleTestaments? testament;

  const LecturesView({
    Key? key,
    this.section = PlanSections.main,
    this.bibleIndex,
    this.testament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures page"),
        leading: IconButton(
            onPressed: () => Get.find<NavigationController>()
                .drawerKey
                .currentState!
                .openDrawer(),
            icon: Icon(
              Icons.menu,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: controller.obx(
          (state) => GetX<LecturesController>(
            builder: (getController) {
              switch (getController.currentSection.value) {
                case PlanSections.main:
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //change
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,

                      //change height 125
                      mainAxisExtent: 125,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) => PlanCard(
                      category: "Reina Valera",
                      color: "626677",
                      projectName: "Bible",
                      ratingsLowerNumber: state!.books.length,
                      ratingsUpperNumber: state.finishedBooksCount,
                      onPressed: () => getController.currentSection.value =
                          PlanSections.books,
                    ),
                    itemCount: 1,
                  );

                case PlanSections.books:
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //change
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,

                      //change height 125
                      mainAxisExtent: 125,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) => PlanCard(
                      projectName: state!.books[index].name,
                      color: lectureColors[index],
                      category: state.books[index].id.toLowerCase(),
                      ratingsLowerNumber: state.books[index].totalChapters,
                      ratingsUpperNumber: state.books[index].readedChapters,
                      onPressed: () {
                        getController.activeBook = state.books[index];
                        getController.currentSection.value =
                            PlanSections.chapters;
                      },
                    ),
                    itemCount: state!.books.length,
                  );
                case PlanSections.chapters:
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //change
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,

                      //change height 125
                      mainAxisExtent: 125,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) => PlanCard(
                      projectName: getController.activeBook!.nameLong +
                          " " +
                          getController.activeBook!.chapters[index].number,
                      color: lectureColors[Random().nextInt(66)],
                      category: getController.activeBook!.chapters[index].id,
                      ratingsLowerNumber: 1,
                      ratingsUpperNumber:
                          getController.activeBook!.chapters[index].readed
                              ? 1
                              : 0,
                      onPressed: () {},
                    ),
                    itemCount: getController.activeBook!.chapters.length,
                  );
              }
            },
          ),
        ),
      ),
    );
    return TabPage(
      horizontalPadding: 20.0,
      children: _sectionsContent(
        context,
      ),
    );
  }

  List<Widget> _sectionsContent(
    BuildContext context,
  ) {
    switch (section) {
      case PlanSections.main:
        return [
          PlanTile(
            title: "Antiguo Testamento",
            totalBooks: 12,
            readedBooks: 1,
            onPressed: () {
              Get.find<TabsController>().goToSubTabView(
                  LecturesView(
                    section: PlanSections.books,
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
              Get.find<TabsController>().goToSubTabView(
                  LecturesView(
                    section: PlanSections.books,
                    testament: BibleTestaments.nt,
                  ),
                  context);
            },
          ),
        ];
      case PlanSections.books:
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
            endIndex = controller.state!.books.length;
            break;
        }

        for (int i = startIndex; i < endIndex; i++) {
          content.add(PlanTile(
            title: controller.state!.books[i].name,
            readedBooks: controller.state!.books[i].readedChapters,
            totalBooks: controller.state!.books[i].totalChapters,
            onPressed: () {
              Get.find<TabsController>().goToSubTabView(
                  LecturesView(
                    section: PlanSections.chapters,
                    bibleIndex: i,
                  ),
                  context);
            },
          ));
        }
        return content;

      case PlanSections.chapters:
        List<Widget> content = List<Widget>.empty(growable: true);

        for (int i = 0;
            i < controller.state!.books[bibleIndex!].chapters.length;
            i++) {
          content.add(
            ChapterTile(
                title: controller.state!.books[bibleIndex!].name +
                    " " +
                    controller.state!.books[bibleIndex!].chapters[i].number,
                readed: controller.state!.books[bibleIndex!].chapters[i].readed,
                onPressed: () {
                  Get.to(() => ReadPage(
                        chapterId:
                            controller.state!.books[bibleIndex!].chapters[i].id,
                      ));
                }),
          );
        }
        return content;
    }
  }
}
