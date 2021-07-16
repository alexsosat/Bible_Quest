import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String title;
  final List<Widget> cards;

  const CardList({Key? key, required this.title, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return cards[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [listTitle, horizontalList],
    );
  }
}
