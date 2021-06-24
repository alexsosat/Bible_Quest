import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContinueReadingBox extends StatelessWidget {
  const ContinueReadingBox({Key? key}) : super(key: key);

  String _getImage() {
    List<int> png = [1, 4, 5, 9, 10];
    final _random = new Random();
    //TODO: search for better background images
    int index = 1 + _random.nextInt(10 - 1);
    String extension = png.contains(index) ? 'png' : 'jpg';

    return 'assets/images/backgrounds/background-$index.$extension';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
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
            child: LinearPercentIndicator(
              percent: 0.5,
              backgroundColor: Color(0xFF545568),
              linearGradient: LinearGradient(colors: <Color>[
                Color.fromRGBO(0, 153, 255, 1.0),
                Color.fromRGBO(204, 97, 255, 1.0)
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
