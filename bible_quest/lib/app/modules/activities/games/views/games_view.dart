import 'package:flutter/material.dart';

class GamesView extends StatelessWidget {
  const GamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
      ),
      body: Center(
        child: Text("Games body"),
      ),
    );
  }
}
