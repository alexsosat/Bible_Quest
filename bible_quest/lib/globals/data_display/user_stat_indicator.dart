import 'package:flutter/material.dart';

class UserStatIndicator extends StatelessWidget {
  final Icon icon;
  final String data;
  final MainAxisAlignment alignment;
  final double separation;
  const UserStatIndicator({
    Key? key,
    required this.icon,
    required this.data,
    this.alignment = MainAxisAlignment.start,
    this.separation = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: separation),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(data),
          ),
        ],
      ),
    );
  }
}
