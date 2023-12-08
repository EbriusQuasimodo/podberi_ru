import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/app_theme_data.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'ПодбериРу',
      theme: AppThemeData().themeData(context),
      routerConfig: goRouter,
      builder: (BuildContext context, child) {
        return Scaffold(
          body: Stack(
            children: [
              child!,
              Positioned(
                  right: 0,
                  bottom: 72,
                  child: CircleAvatar(
                      backgroundColor: ThemeApp.backgroundBlack,
                      child: IconButton(
                        onPressed: () {
                          GetIt.I<Alice>().showInspector();
                        },
                        icon: Icon(Icons.http),
                        color: ThemeApp.mainWhite,
                      )))
            ],
          ),
        );
      },
    );
  }
}
