import 'package:bible_quest/pages/tabs/tabs.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(
      //MyApp()
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Bible Quest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(25, 26, 50, 1.0),
          brightness: Brightness.dark,
          primaryColor: Color.fromRGBO(51, 230, 246, 1.0),
          accentColor: Color.fromRGBO(41, 52, 208, 1.0),
          cardColor: Color.fromRGBO(21, 21, 41, 1.0),
          fontFamily: 'sk_Modernist',
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
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder,
        home: TabsPage());
  }
}
