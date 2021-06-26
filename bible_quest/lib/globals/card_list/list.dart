import 'package:bible_quest/globals/card_list/item.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String title;
  final List<CardItem> cards;

  const CardList({Key? key, required this.title, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listChildren = [SizedBox(width: 17), ...cards];

    final listTitle = Container(
      margin: EdgeInsets.only(bottom: 20, left: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );

    final horizontalList = Container(
      height: 160,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: listChildren,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [listTitle, horizontalList],
    );
  }
}
