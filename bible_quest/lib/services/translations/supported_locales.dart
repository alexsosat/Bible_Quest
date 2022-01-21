import 'dart:ui';

import 'package:get/utils.dart';

class BibleQuestLocales {
  static final spanishLocale = supportedLocales[0];
  static final englishLocale = supportedLocales[1];

  static final List<Locale> supportedLocales = [
    Locale('es', 'MX'),
    Locale('en'),
  ];

  static bool isLocaleSpanish() => Get.locale == supportedLocales[0];
}
