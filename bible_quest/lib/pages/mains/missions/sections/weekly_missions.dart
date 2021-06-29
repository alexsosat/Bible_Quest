import 'package:bible_quest/globals/round_tile.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:flutter/material.dart';

class WeeklyMissions extends StatelessWidget {
  const WeeklyMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TabPage(
        topSpace: 0,
        bottomSpace: 95,
        children: <Widget>[
          RoundListTile(
            percentage: 0.5,
            title: Text(
              "Leer siete capítulos del Génesis",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "25",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          RoundListTile(
            percentage: 0.3,
            title: Text(
              "Llegar al nivel 5",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "10",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          RoundListTile(
            percentage: 0.1,
            title: Text(
              "Memoriza el versículo de memoria",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "15",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
