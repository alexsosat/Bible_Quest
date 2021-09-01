import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final List<Widget> children;
  final double topSpace;
  final double bottomSpace;
  final double horizontalPadding;
  const TabPage({
    Key? key,
    required this.children,
    this.topSpace = 115,
    this.bottomSpace = 95,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      children: <Widget>[
        SizedBox(height: topSpace),
        ...children,
        SizedBox(height: bottomSpace),
      ],
    );
  }
}
