import 'package:flutter/material.dart';

class UserCharacter extends StatelessWidget {
  final double size;
  const UserCharacter({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Container(
        color: Colors.red,
        height: size,
        width: size,
      ),
    );
  }
}
