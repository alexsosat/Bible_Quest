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
    titleTextStyle: Get.textTheme.headline6!.copyWith(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 16),
  ),
);
