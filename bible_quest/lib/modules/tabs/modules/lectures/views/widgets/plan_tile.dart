import 'package:bible_quest/globals/tiles/percentage_tile.dart';
import 'package:flutter/material.dart';

class PlanTile extends StatelessWidget {
  final String title;
  final int totalBooks;
  final int readedBooks;
  final Function()? onPressed;
  const PlanTile({
    Key? key,
    required this.title,
    required this.totalBooks,
    required this.readedBooks,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PercentageListTile(
      onPressed: onPressed,
      percentage: readedBooks / totalBooks,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
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
      ),
    );
  }
}
