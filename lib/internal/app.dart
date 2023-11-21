import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/app_routes.dart';
import 'package:podberi_ru/core/styles/app_theme_data.dart';
import 'package:podberi_ru/core/utils/theme_mode.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'ПодбериРу',
      theme: AppThemeData().themeData(context, darkMode),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: goRouter,
    );
  }
}
