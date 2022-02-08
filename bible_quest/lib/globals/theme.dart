import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final appTheme = ThemeData(
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
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: Get.textTheme.headline4!.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  textTheme: TextTheme(
    headline1: Get.textTheme.headline1!.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: Get.textTheme.headline5!.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: Get.textTheme.bodyText1!.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);
