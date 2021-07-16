import 'package:flutter/material.dart';

class CardDisplay extends StatelessWidget {
  final Widget content;
  final Widget title;
  const CardDisplay({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {},
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
