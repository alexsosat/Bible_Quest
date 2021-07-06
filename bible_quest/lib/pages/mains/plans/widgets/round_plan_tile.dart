import 'package:bible_quest/globals/round_tile.dart';
import 'package:flutter/material.dart';

class PlanTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int? totalBooks;
  final int? readedBooks;
  final Function()? onPressed;
  const PlanTile({
    Key? key,
    required this.title,
    this.totalBooks,
    this.readedBooks,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundListTile(
      onPressed: onPressed,
      percentage: (![readedBooks, totalBooks].contains(null))
          ? readedBooks! / totalBooks!
          : null,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: (![readedBooks, totalBooks].contains(null))
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Libros: $totalBooks",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                Text(
                  "Leídos: $readedBooks",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            )
          : (subtitle != null)
              ? Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              : Container(),
    );
  }
}
