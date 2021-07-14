import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatBar extends StatelessWidget {
  final Icon icon;
  final int maxValue;
  final int currtentValue;
  final Color barColor;

  const StatBar({
    Key? key,
    required this.icon,
    required this.barColor,
    required this.currtentValue,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LinearPercentIndicator(
          animation: true,
          animationDuration: 1000,
          lineHeight: 10.0,
          leading: icon,
          percent: currtentValue / maxValue,
          progressColor: barColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text("$currtentValue/$maxValue"),
        )
      ],
    );
  }
}
