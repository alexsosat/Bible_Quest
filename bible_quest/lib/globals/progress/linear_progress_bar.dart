import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBar extends StatelessWidget {
  final Icon? icon;
  final int maxValue;
  final int currentValue;
  final Color? barColor;
  final LinearGradient? gradient;
  final bool showTextStatus;
  final double lineWidth;

  const LinearProgressBar({
    Key? key,
    required this.currentValue,
    required this.maxValue,
    this.showTextStatus = false,
    this.lineWidth = 5.0,
    this.icon,
    this.barColor,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LinearPercentIndicator(
          animation: true,
          animationDuration: 1000,
          backgroundColor: Color(0xFF545568),
          lineHeight: lineWidth,
          leading: icon,
          percent: currentValue / maxValue,
          progressColor: barColor,
          linearGradient: gradient,
        ),
        if (showTextStatus)
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("$currentValue/$maxValue"),
          )
      ],
    );
  }
}
