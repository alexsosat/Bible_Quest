import 'package:bible_quest/app/modules/activities/lectures/navigation/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/views/widgets/progress_card.dart';
import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LecturesView extends GetView<LecturesController> {
  const LecturesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Lectures page"),
      ),
      body: controller.obx(
        (state) => GridView.builder(
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
              onPressed: () => Get.toNamed(Routes.LECTURESBOOKS("1"))),
          itemCount: 1,
        ),
      ),
    );
  }
}
