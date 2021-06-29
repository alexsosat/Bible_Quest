import 'package:bible_quest/globals/round_tile.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: TabPage(
        children: <Widget>[
          RoundListTile(
            onPressed: () {},
            percentage: 0.5,
            title: Text(
              "Antiguo Testamento",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Libros: 12",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                Text(
                  "Leídos: 1",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          RoundListTile(
            onPressed: () {},
            percentage: 0.2,
            title: Text(
              "Nuevo Testamento",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Libros: 24",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                Text(
                  "Leídos: 2",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          RoundListTile(
            onPressed: () {},
            percentage: 0,
            title: Text(
              "Planes",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Libros: 1",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                Text(
                  "Leídos: 0",
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
