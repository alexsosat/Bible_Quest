import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget title;
  final Widget centerItem;
  final double height;
  final double width;
  final double radiusSpread;

  const CardItem({
    Key? key,
    required this.title,
    required this.centerItem,
    this.height = 164,
    this.width = 124,
    this.radiusSpread = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
        primary: Colors.white,
        backgroundColor: Color(0xFF151529),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(radiusSpread),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: centerItem,
          ),
          title,
        ],
      ),
    );
  }
}
