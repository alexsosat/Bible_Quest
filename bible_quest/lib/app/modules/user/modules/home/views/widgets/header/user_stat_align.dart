import 'package:bible_quest/globals/data_display/user_stat_indicator.dart';
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
      child: UserStatIndicator(
        data: data,
        icon: icon,
        alignment: alignment,
      ),
    );
  }
}
