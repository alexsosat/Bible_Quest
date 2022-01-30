import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/lectures_colors.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/progress_card.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LecturesBooksView extends GetView<LecturesController> {
  const LecturesBooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures page"),
      ),
      body: controller.obx(
        (state) => GridView.builder(
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
              Get.toNamed(Routes.LECTURESCHAPTERS("1", index.toString()));
            },
          ),
          itemCount: controller.state!.books.length,
        ),
      ),
    );
  }
}
