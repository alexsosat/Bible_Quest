import 'package:bible_quest/globals/circular_progress_bar.dart';
import 'package:flutter/material.dart';

class PercentageListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final double percentage;
  final Function()? onPressed;
  const PercentageListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.percentage,
    this.onPressed,
  }) : super(key: key);

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
          children: <Widget>[
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
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: CircularProgressBar(
                  percent: percentage!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
