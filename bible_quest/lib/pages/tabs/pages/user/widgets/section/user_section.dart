import 'package:flutter/material.dart';

import 'sprite_card.dart';

class UserSection extends StatelessWidget {
  final String headerTitle;
  final List<SpriteCard> children;
  const UserSection({
    Key? key,
    required this.headerTitle,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child:
                Text(headerTitle, style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            width: double.infinity,
            child: GridView.count(
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              childAspectRatio: 0.7,
              shrinkWrap: true,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
