import 'package:flutter/material.dart';

class UserStatAlign extends StatelessWidget {
  final MainAxisAlignment alignment;
  final Icon icon;
  final String data;
  const UserStatAlign({
    Key? key,
    required this.alignment,
    required this.icon,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }
}
