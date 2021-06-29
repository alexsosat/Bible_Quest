import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  final int pageIndex;
  final PageController controller;
  final String text;
  const SectionButton(
      {Key? key,
      required this.pageIndex,
      required this.controller,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          onPressed: () => controller.animateToPage(
                pageIndex,
                curve: Curves.ease,
                duration: Duration(milliseconds: 500),
              ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          )),
    );
  }
}
