import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bible Quest',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      locale: Locale('es'),
      supportedLocales: [
        Locale('es'),
        Locale('en'),
      ],
      fallbackLocale: Locale('es'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(25, 26, 50, 1.0),
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(51, 230, 246, 1.0),
        accentColor: Color.fromRGBO(41, 52, 208, 1.0),
        cardColor: Color(0xFF151529),
        fontFamily: 'sk_Modernist',
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          textTheme: TextTheme(
            headline6: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        Intl.defaultLocale = Localizations.localeOf(context).languageCode;
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}
