import 'package:bible_quest/pages/mains/user/widgets/stats/stat_bar.dart';
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
      child: Row(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatBar(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    barColor: Colors.red,
                    currtentValue: 20,
                    maxValue: 100,
                  ),
                  StatBar(
                    icon: Icon(TabIcons.upgrade, color: Colors.yellow),
                    barColor: Colors.yellow,
                    currtentValue: 200,
                    maxValue: 255,
                  ),
                  StatBar(
                    icon: Icon(Icons.backpack_sharp, color: Colors.green),
                    barColor: Colors.green,
                    currtentValue: 100,
                    maxValue: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
