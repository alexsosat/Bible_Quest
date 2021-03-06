import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';

import 'user_currency.dart';
import 'user_stats.dart';

class UserStatSection extends StatelessWidget {
  UserStatSection({Key? key}) : super(key: key);

  final double _size = 125;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 140),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              UserCharacter(size: _size),
              UserStats(size: _size),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: UserCurrencies(),
          ),
        ],
      ),
    );
  }
}
