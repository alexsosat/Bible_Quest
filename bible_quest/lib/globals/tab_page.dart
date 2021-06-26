import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final List<Widget> children;
  const TabPage({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 115),
        ...children,
        SizedBox(height: 95),
      ],
    );
  }
}
