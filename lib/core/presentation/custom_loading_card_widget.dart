import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CustomLoadingCardWidget extends StatelessWidget {
  final double bottomPadding;
  const CustomLoadingCardWidget({super.key, required this.bottomPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(
        top: 2, bottom: bottomPadding
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 21),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeApp.mainWhite,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
