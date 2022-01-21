import 'package:bible_quest/app/modules/login/bindings/authentication_binding.dart';
import 'package:bible_quest/services/translations/supported_locales.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'app/routes/app_pages.dart';
import 'services/translations/flutter_translations.dart';
import 'services/translations/get_translations.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  await FlutterTranslations.initialize();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bible Quest',
      initialBinding: AuthenticationBinding(),
      //Routing
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

      //Internationalization
      translations: Messages(),
      locale: BibleQuestLocales.spanishLocale,
      supportedLocales: BibleQuestLocales.supportedLocales,
      fallbackLocale: BibleQuestLocales.spanishLocale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      //theme
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(25, 26, 50, 1.0),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Color.fromRGBO(51, 230, 246, 1.0),
          secondary: Color.fromRGBO(41, 52, 208, 1.0),
        ),
        cardColor: Color(0xFF151529),
        fontFamily: 'sk_Modernist',
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),

      //Builder
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
