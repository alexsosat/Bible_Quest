import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("News body"),
      ),
    );
  }
}
