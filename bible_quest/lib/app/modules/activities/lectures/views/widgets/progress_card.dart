import 'package:bible_quest/globals/progress/linear_progress_bar.dart';
import 'package:bible_quest/utils/colors.dart';
import 'package:flutter/material.dart';

import 'card_badge.dart';

class PlanCard extends StatelessWidget {
  final String projectName;
  final String category;
  final int ratingsUpperNumber;
  final int ratingsLowerNumber;
  final String color;

  const PlanCard(
      {Key? key,
      required this.projectName,
      required this.category,
      required this.ratingsUpperNumber,
      required this.ratingsLowerNumber,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: HexColor.fromHex("20222A"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  ColouredProjectBadge(color: color, category: category),
                  SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          category,
                          style: TextStyle(
                            color: HexColor.fromHex("626677"),
                          ),
                        ),
                      ])
                ]),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: HexColor.fromHex(color),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "$ratingsUpperNumber/$ratingsLowerNumber",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (category == "Development"
                          ? Colors.black
                          : Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            LinearProgressBar(
              currentValue: ratingsUpperNumber,
              maxValue: ratingsLowerNumber,
              barColor: HexColor.fromHex(color),
            )
          ],
        ),
      ),
    );
  }
}
