import 'package:bible_quest/globals/progress/circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  const UserStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 35, 20, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircularProgressBar(
            percent: 0.5,
            fillColor: Colors.red,
            subtitle: "Vida",
            radius: 85,
          ),
          CircularProgressBar(
            percent: 0.3,
            fillColor: Colors.lightBlueAccent,
            subtitle: "Experiencia",
            radius: 85,
          ),
          CircularProgressBar(
            percent: 1.0,
            fillColor: Colors.orangeAccent,
            subtitle: "Racha",
            radius: 85,
          ),
        ],
      ),
    );
  }
}
