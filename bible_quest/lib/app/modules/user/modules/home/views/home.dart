import 'package:bible_quest/app/modules/user/modules/home/views/widgets/home_appbar.dart';
import 'package:bible_quest/app/modules/user/modules/home/views/widgets/header/user_header_layout.dart';
import 'package:flutter/material.dart';

import 'widgets/current_reading_box.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: HomeAppbar(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          UserHeaderLayout(),
          ContinueReadingBox(),
        ],
      ),
    );
  }
}
