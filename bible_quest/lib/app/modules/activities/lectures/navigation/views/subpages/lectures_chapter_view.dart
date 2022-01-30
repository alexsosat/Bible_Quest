import 'dart:math';

import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/lectures_colors.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/progress_card.dart';
import 'package:bible_quest/app/modules/activities/lectures/read/views/read_page.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LecturesChaptersView extends GetView<LecturesController> {
  const LecturesChaptersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final book = controller.state!.books[int.parse(Get.parameters['book_id']!)];
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures page"),
      ),
      body: controller.obx(
        (state) => GridView.builder(
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
            onPressed: () => Get.toNamed(
              Routes.LECTURESREAD(
                  "1", Get.parameters['book_id']!, book.chapters[index].id),
            ),
          ),
          itemCount: book.chapters.length,
        ),
      ),
    );
  }
}
