import 'package:bible_quest/globals/circular_progress_bar.dart';
import 'package:flutter/material.dart';

class RoundListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final double? percentage;
  final Function()? onPressed;
  const RoundListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.percentage,
    this.onPressed,
  }) : super(key: key);

  List<Widget> _childrenRow() {
    List<Widget> children = <Widget>[
      Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: title,
            ),
            Container(
              child: subtitle,
            )
          ],
        ),
      ),
    ];

    if (percentage != null)
      children.add(
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: CircularProgressBar(
              percent: percentage!,
            ),
          ),
        ),
      );
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          primary: Colors.white,
          backgroundColor: Color(0xFF151529),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Row(
          children: _childrenRow(),
        ),
      ),
    );
  }
}
