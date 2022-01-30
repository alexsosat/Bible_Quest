import 'package:flutter/material.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Achievements"),
      ),
      body: Center(
        child: Text("Achievements body"),
      ),
    );
  }
}
