import 'package:bible_quest/globals/layout/tab_page.dart';
import 'package:flutter/material.dart';

import 'widgets/stats/achivements.dart';
import 'widgets/stats/equipment.dart';
import 'widgets/stats/stat_section.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return TabPage(
    //   children: <Widget>[
    //     UserStatSection(),
    //     EquipmentSection(),
    //     AchievementsSection(),
    //   ],
    // );

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            EquipmentSection(),
            AchievementsSection(),
            SizedBox(height: 95),
          ]),
        ),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 300,
      floating: false,
      pinned: false,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: UserStatSection(),
      ),
    );
  }
}
