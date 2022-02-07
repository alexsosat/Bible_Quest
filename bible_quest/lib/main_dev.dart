import 'package:bible_quest/app/modules/login/bindings/authentication_binding.dart';
import 'package:bible_quest/globals/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

import 'package:device_preview/device_preview.dart';

import 'services/translations/flutter_translations.dart';
import 'services/translations/get_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await FlutterTranslations.initialize();
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
      translations: Messages(),
      locale: DevicePreview.locale(context),
      supportedLocales: [
        Locale('es', 'MX'),
        Locale('en'),
      ],
      fallbackLocale: Locale('es', 'MX'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      //theme
      theme: appTheme,

      //Builder
      builder: DevicePreview.appBuilder,
    );
  }
}
