import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

///иконка для нижнего бара навигации
BottomNavigationBarItem bottomNavigationItem(
  String icon,
  String label,
) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: SvgPicture.asset(icon),
    ),
    label: label,
    activeIcon: Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: SvgPicture.asset(
        icon,
        color: ThemeApp.mainBlue,
      ),
    ),
  );
}
