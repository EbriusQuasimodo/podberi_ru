import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ConditionsWidget extends StatelessWidget {
  const ConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: 72),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 30, bottom: 20, left: 15, right: 15),
              child: Text(
                'Условия по карте в 2023 году',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeApp.backgroundBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
              child: Text(
                'Банк Тинькофф позволяет зарабатывать на своей дебетовой карточке. Если у вас на карте будет 300 000 рублей, то за год вы получите до 15 000 руб., которые возвращаются на карту ежемесячными платежами.\n\nКонечно мы понимаем, что подобный остаток может быть только у весьма зажиточных граждан, и по большей части проживающих в центральных развитых регионах (Москва, Санкт-Петербург). Возьмем более приземленный для россиян пример расчета — 30 000 рублей. При таком остатке вы сможете рассчитывать на бонус до 1500 рублей каждый год. В этом есть главное преимущество и ключевое достоинство карты Tinkoff Black платежной системы МИР.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ThemeApp.backgroundBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
