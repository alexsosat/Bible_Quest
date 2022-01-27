import 'dart:math';

import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/lectures_colors.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/progress_card.dart';
import 'package:bible_quest/app/modules/activities/lectures/read/views/read_page.dart';
import 'package:bible_quest/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:bible_quest/globals/layout/navigation_builder.dart';
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
      body: controller.obx(
        (state) => GetX<LecturesController>(
          builder: (getController) => NavigationBuilder<PlanSections>(
            values: PlanSections.values,
            currentValue: getController.currentSection.value,
            willPopScope: (newValue) =>
                getController.currentSection.value = newValue,
            pages: [
              mainSection(),
              booksPage(),
              chaptersPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainSection() => GridView.builder(
        padding: EdgeInsets.all(20.0),
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
          ratingsLowerNumber: controller.state!.books.length,
          ratingsUpperNumber: controller.state!.finishedBooksCount,
          onPressed: () => controller.currentSection.value = PlanSections.books,
        ),
        itemCount: 1,
      );

  Widget booksPage() => ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () =>
                    controller.currentSection.value = PlanSections.main,
                icon: Icon(Icons.chevron_left),
              ),
            ],
          ),
          GridView.builder(
            padding: EdgeInsets.all(20.0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //change
              crossAxisCount: 1,
              mainAxisSpacing: 10,

              //change height 125
              mainAxisExtent: 125,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (_, index) => PlanCard(
              projectName: controller.state!.books[index].name,
              color: lectureColors[index],
              category: controller.state!.books[index].id.toLowerCase(),
              ratingsLowerNumber: controller.state!.books[index].totalChapters,
              ratingsUpperNumber: controller.state!.books[index].readedChapters,
              onPressed: () {
                controller.activeBook = index;
                controller.currentSection.value = PlanSections.chapters;
              },
            ),
            itemCount: controller.state!.books.length,
          ),
        ],
      );

  Widget chaptersPage() {
    final book = controller.state!.books[controller.activeBook!];
    return ListView(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () =>
                  controller.currentSection.value = PlanSections.books,
              icon: Icon(Icons.chevron_left),
            ),
          ],
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //change
            crossAxisCount: 1,
            mainAxisSpacing: 10,

            //change height 125
            mainAxisExtent: 125,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, index) => PlanCard(
            projectName: book.nameLong + " " + book.chapters[index].number,
            color: lectureColors[Random().nextInt(66)],
            category: book.chapters[index].id,
            ratingsLowerNumber: 1,
            ratingsUpperNumber: book.chapters[index].readed ? 1 : 0,
            onPressed: () => Get.to(
              () => ReadPage(
                chapterId: book.chapters[index].id,
              ),
            ),
          ),
          itemCount: book.chapters.length,
        ),
      ],
    );
  }
}
