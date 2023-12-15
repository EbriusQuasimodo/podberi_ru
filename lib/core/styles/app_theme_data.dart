import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

///общая тема всего приложения
class AppThemeData {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      fontFamily: 'Geologica',
      scaffoldBackgroundColor: ThemeApp.backgroundBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        color: ThemeApp.mainWhite,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: ThemeApp.mainWhite,
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
        unselectedItemColor: ThemeApp.backgroundBlack,
        selectedItemColor: ThemeApp.mainBlue,
      ),
      brightness: Brightness.light,
    );
  }
}
