import 'package:bible_quest/bloc/plans/read.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPage extends StatelessWidget {
  final String chapterId;
  final String chapterName;

  const ReadPage({
    Key? key,
    required this.chapterId,
    required this.chapterName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(chapterName),
        ),
        body: GetX<ReadController>(
          init: ReadController(chapterId: chapterId),
          builder: (_) {
            if (_.isLoading.value)
              return Center(child: CircularProgressIndicator());
            return RawScrollbar(
              thumbColor: Colors.redAccent,
              radius: Radius.circular(20),
              thickness: 5,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _.content.value,
                  style: Get.textTheme.subtitle1!.copyWith(height: 1.5),
                ),
              ),
            );
          },
        ));
  }
}
