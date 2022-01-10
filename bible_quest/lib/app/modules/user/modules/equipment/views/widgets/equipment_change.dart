import 'package:flutter/material.dart';

class EquipmentChange extends StatelessWidget {
  final Function() onReturn;
  const EquipmentChange({Key? key, required this.onReturn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onReturn,
      child: Text("Return to menu"),
    );
  }
}
