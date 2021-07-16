import 'package:flutter/material.dart';

class UserSection extends StatelessWidget {
  final String headerTitle;
  const UserSection({Key? key, required this.headerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child:
                Text(headerTitle, style: Theme.of(context).textTheme.headline6),
          ),
          Wrap(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
