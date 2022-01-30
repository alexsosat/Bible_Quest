import 'package:flutter/material.dart';

class ExchangeStoreView extends StatelessWidget {
  const ExchangeStoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exchange Store"),
      ),
      body: Center(
        child: Text("Exchange Store"),
      ),
    );
  }
}
