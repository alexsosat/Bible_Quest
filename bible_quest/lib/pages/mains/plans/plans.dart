import 'package:bible_quest/bloc/plans/plan.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/models/bible/indexes/sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: GetBuilder<PlansController>(
          init: PlansController(section: BibleSections.main),
          builder: (_) {
            if (_.isLoading.value)
              return Center(child: CircularProgressIndicator());
            return TabPage(
              children: _.content,
            );
          }),
    );
  }
}
