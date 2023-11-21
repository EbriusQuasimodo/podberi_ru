import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData themeData(BuildContext context, bool darkMode) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: darkMode ? Colors.black45 : const Color(0xff8338EC),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkMode ? Colors.black45 : const Color(0xff8338EC),
      ),
      brightness: darkMode ? Brightness.dark : Brightness.light,
    );
  }
}
