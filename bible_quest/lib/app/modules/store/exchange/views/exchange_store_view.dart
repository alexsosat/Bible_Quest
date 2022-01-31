import 'package:bible_quest/app/modules/navigation/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ExchangeStoreView extends StatelessWidget {
  const ExchangeStoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exchange Store"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Exchange Store"),
      ),
    );
  }
}
