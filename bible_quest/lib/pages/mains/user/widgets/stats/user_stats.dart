import 'package:bible_quest/globals/progress/linear_progress_bar.dart';
import 'package:bible_quest/pages/tabs/widgets/tab_icons_icons.dart';
import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  const UserStats({Key? key}) : super(key: key);

  final double _size = 125;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Container(
                  color: Colors.red,
                  height: _size,
                  width: _size,
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: _size,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LinearProgressBar(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        barColor: Colors.red,
                        currentValue: 20,
                        maxValue: 100,
                        showTextStatus: true,
                        lineWidth: 7,
                      ),
                      LinearProgressBar(
                        icon: Icon(TabIcons.upgrade,
                            color: Colors.lightBlueAccent),
                        barColor: Colors.lightBlueAccent,
                        currentValue: 200,
                        maxValue: 255,
                        showTextStatus: true,
                        lineWidth: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(children: <Widget>[
              Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
              ),
              Text("Nivel 12"),
              Expanded(child: SizedBox()),
              Icon(Icons.monetization_on, color: Colors.yellow, size: 18),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("36.68")),
            ]),
          ),
        ],
      ),
    );
  }
}
