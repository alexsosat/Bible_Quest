import 'package:flutter/material.dart';

import 'stat_section.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({Key? key}) : super(key: key);

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
