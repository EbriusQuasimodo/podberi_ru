import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CustomAppBarWithProductName extends StatelessWidget {
  const CustomAppBarWithProductName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        color: ThemeApp.mainWhite,
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Row(children: [Container(color: ThemeApp.grey,
                child: Text('eroijhtjgo'),), Container(
                  color: ThemeApp.grey, child: Text('eroijhtjgo'),)],)
          ),
        ],
      ),
    );
  }
}
