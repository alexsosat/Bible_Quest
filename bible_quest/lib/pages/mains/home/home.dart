import 'package:bible_quest/pages/mains/home/widgets/current_reading_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListView(
        children: <Widget>[
          ContinueReadingBox(),
        ],
      ),
    );
  }
}
