import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String emoji;
  const CardItem({
    Key? key,
    required this.title,
    required this.emoji,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: 124,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Color(0xFF151529),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: RichText(
              text: TextSpan(
                  text: emoji,
                  style: TextStyle(fontSize: 35, fontFamily: 'Noto')),
            ),
          ),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
