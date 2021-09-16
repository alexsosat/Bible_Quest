import 'package:bible_quest/app/modules/login/bindings/authentication_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

import 'package:device_preview/device_preview.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
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
      locale: DevicePreview.locale(context),
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
      builder: DevicePreview.appBuilder,
    );
  }
}
