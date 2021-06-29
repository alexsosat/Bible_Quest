import 'package:bible_quest/pages/mains/missions/widgets/section_button.dart';
import 'package:flutter/material.dart';

class SectionRow extends StatelessWidget {
  final PageController controller;
  const SectionRow({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SectionButton(pageIndex: 0, controller: controller, text: "Día"),
          SectionButton(pageIndex: 1, controller: controller, text: "Semana"),
          SectionButton(pageIndex: 2, controller: controller, text: "Mes"),
        ],
      ),
    );
  }
}
