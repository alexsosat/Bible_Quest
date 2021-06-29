import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgressBar extends StatelessWidget {
  final Color fillColor;
  final double percent;
  final String? subtitle;
  final double radius;
  const CircularProgressBar({
    Key? key,
    required this.percent,
    this.subtitle,
    this.fillColor = Colors.green,
    this.radius = 75.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      percent: percent,
      backgroundColor: fillColor.withOpacity(0.2),
      progressColor: fillColor,
      animation: true,
      animationDuration: 2500,
      lineWidth: 7,
      center: Text(
        (percent * 100).toString() + "%",
        style: Theme.of(context).textTheme.bodyText1,
      ),
      footer: (subtitle != null)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          : null,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
