import 'package:bible_quest/globals/appbar/appbar.dart';
import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final List<Widget> children;
  final double topSpace;
  final double bottomSpace;
  final double horizontalPadding;
  const TabPage({
    Key? key,
    required this.children,
    this.topSpace = 150,
    this.bottomSpace = 95,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          children: <Widget>[
            SizedBox(height: topSpace),
            ...children,
            SizedBox(height: bottomSpace),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: BibleQuestAppBar(),
        ),
      ],
    );
  }
}
