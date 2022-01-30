import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class GamesView extends StatelessWidget {
  const GamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Games body"),
      ),
    );
  }
}
