import 'package:flutter/material.dart';

class CardDisplay extends StatelessWidget {
  final Widget content;
  final Widget title;
  final Function() onPressed;

  const CardDisplay({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color(0xFF151529),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: content),
        title,
      ],
    );
  }
}
