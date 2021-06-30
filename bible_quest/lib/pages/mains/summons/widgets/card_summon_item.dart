import 'package:bible_quest/globals/card_list/item.dart';
import 'package:flutter/material.dart';

class CardSummonItem extends StatelessWidget {
  final String item;
  final int cost;
  const CardSummonItem({Key? key, required this.item, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardItem(
      height: 135,
      width: 105,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.monetization_on_outlined,
            color: Colors.yellow,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              cost.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      centerItem: Image.asset(item, fit: BoxFit.contain),
    );
  }
}
