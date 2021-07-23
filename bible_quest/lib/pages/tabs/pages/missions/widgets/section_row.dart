import 'package:bible_quest/pages/tabs/pages/missions/widgets/section_button.dart';
import 'package:flutter/material.dart';

class SectionRow extends StatelessWidget {
  const SectionRow({
    Key? key,
  }) : super(key: key);

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
          SectionButton(pageIndex: 0, text: "Día"),
          SectionButton(pageIndex: 1, text: "Semana"),
          SectionButton(pageIndex: 2, text: "Mes"),
        ],
      ),
    );
  }
}
