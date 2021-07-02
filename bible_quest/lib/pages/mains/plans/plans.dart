import 'package:bible_quest/bloc/plans/plan_controller.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/models/bible/sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansPage extends StatelessWidget {
  final BibleSections content;

  const PlansPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: GetX<PlansController>(
          init: PlansController(section: content),
          builder: (_) {
            return TabPage(
              children: _.content,
            );
          }),
    );
  }
}
