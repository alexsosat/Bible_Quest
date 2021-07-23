import 'package:flutter/material.dart';

class UserCharacter extends StatelessWidget {
  final double size;
  const UserCharacter({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Container(
        height: size,
        width: size,
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/sprites/base/tile008.png',
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/images/sprites/body/tile060.png',
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/images/sprites/head/tile042.png',
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/images/sprites/arms/tile004.png',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
