import 'dart:math';

import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/lectures_colors.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/progress_card.dart';
import 'package:bible_quest/app/modules/activities/lectures/read/views/read_page.dart';
import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LecturesView extends GetView<LecturesController> {
  const LecturesView({
    Key? key,
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
                      onPressed: () => Get.to(
                        () => ReadPage(
                          chapterId:
                              getController.activeBook!.chapters[index].id,
                        ),
                      ),
                    ),
                    itemCount: getController.activeBook!.chapters.length,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
