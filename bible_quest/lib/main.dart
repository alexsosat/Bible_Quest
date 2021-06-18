import 'package:bible_quest/pages/tabs/tabs.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bible Quest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(25, 26, 50, 1.0),
          brightness: Brightness.dark,
          primaryColor: Color.fromRGBO(51, 230, 246, 1.0),
          accentColor: Color.fromRGBO(41, 52, 208, 1.0),
          cardColor: Color.fromRGBO(21, 21, 41, 1.0),
          appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              textTheme: TextTheme(
                  headline6: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      )),
              iconTheme: IconThemeData(
                color: Colors.white,
              )),
        ),
        home: TabsPage());
  }
}
