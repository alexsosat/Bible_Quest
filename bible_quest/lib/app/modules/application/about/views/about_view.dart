import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("About body"),
      ),
    );
  }
}
