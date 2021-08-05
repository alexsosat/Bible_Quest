import 'dart:math';

import 'package:bible_quest/globals/progress/linear_progress_bar.dart';
import 'package:flutter/material.dart';

class ContinueReadingBox extends StatelessWidget {
  const ContinueReadingBox({Key? key}) : super(key: key);

  String _getImage() {
    List<int> png = [1, 4, 5, 9, 10];
    final _random = new Random();
    int index = 1 + _random.nextInt(10 - 1);
    String extension = png.contains(index) ? 'png' : 'jpg';

    return 'assets/images/backgrounds/background-$index.$extension';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color(0xFF151529),
        image: DecorationImage(
          image: AssetImage(_getImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Text(
              "No pierdas tu racha... continua leyendo!!!",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Génesis",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "La creación",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: LinearProgressBar(
              currentValue: 20,
              maxValue: 100,
              lineWidth: 7,
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(0, 153, 255, 1.0),
                  Color.fromRGBO(204, 97, 255, 1.0)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
