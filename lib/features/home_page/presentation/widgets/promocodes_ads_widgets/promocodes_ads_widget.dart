import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

import 'canvas_background.dart';
///промокодов временно не будет ( планируется добавить после релиза мвп)
class PromoCodesAdsWidget extends StatelessWidget {
  ///виджет с рекламой нашей страницы промокодов
  const PromoCodesAdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 57,
                right: 50,
                left: 50,
              ),
              child: Text(
                'Бесплатные промокоды на вкусные и любимые тематики',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            CanvasBackground(),
          ],
        ),
      ),
    );
  }
}
