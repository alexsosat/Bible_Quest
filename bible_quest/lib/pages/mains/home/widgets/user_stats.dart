import 'package:bible_quest/globals/circular_progress_bar.dart';
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
            fillColor: Colors.green,
            subtitle: "Vida",
          ),
          CircularProgressBar(
            percent: 0.3,
            fillColor: Colors.lightBlueAccent,
            subtitle: "Experiencia",
          ),
          CircularProgressBar(
            percent: 1.0,
            fillColor: Colors.orangeAccent,
            subtitle: "Racha",
          ),
        ],
      ),
    );
  }
}
