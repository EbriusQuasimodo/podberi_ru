import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CustomErrorPageWidget extends ConsumerWidget {
  final String error;
  final double bottomPadding;
  final VoidCallback onTap;
  final String buttonName;

  ///кастомный виджет с ошибкой
  const CustomErrorPageWidget({
    super.key,
    required this.error,
    required this.bottomPadding,
    required this.onTap,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          bottom: bottomPadding,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 57, left: 57),
              child: Text(error),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 17,
              ),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width - 30,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.only(
                    top: 17, bottom: 16, left: 75, right: 75),
                onPressed: () {
                  onTap();
                },
                color: ThemeApp.mainBlue,
                child: Text(
                  buttonName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ThemeApp.mainWhite,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
