import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/section/user_section.dart';
import 'widgets/stats/user_stats.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabPage(
      children: <Widget>[
        UserStats(),
        UserSection(headerTitle: "Equipamento"),
        Container(
          color: Colors.yellow,
          height: 400,
          margin: EdgeInsets.only(bottom: 20),
        ),
      ],
    );
  }
}
