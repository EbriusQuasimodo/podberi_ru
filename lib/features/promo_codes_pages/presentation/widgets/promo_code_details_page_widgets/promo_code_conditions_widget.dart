import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class PromoCodeConditionsWidget extends StatelessWidget {
  const PromoCodeConditionsWidget({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30, bottom: 20, left: 15, right: 15),
                child: Text(
                  'Условия',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeApp.backgroundBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
              child: Text(
                'Если ты еще никогда не заказывал в Много лосося, то оформи заказ на сумму от 600 рублей и получи скидку 400 рублей по промокоду. Стандартное время доставки – 60 минут. В отдельных зонах время доставки может быть увеличено до 95 минут – узнать, к какой зоне относится ваш адрес, вы можете в приложении. Минимальная сумма доставки — 600 рублей, но она может варьироваться в зависимости от зоны доставки. Акция доступна новым клиентам в Москве и Санкт-Петербурге.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ThemeApp.backgroundBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6, left: 15, right: 15),
              child: Text(
                'Реклама ООО “Много Лосося”',
                //textAlign: TextAlign.left,
                style: TextStyle(
                  color: ThemeApp.darkestGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Text(
                'ИНН 9704003050',
                // textAlign: TextAlign.left,
                style: TextStyle(
                  color: ThemeApp.darkestGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
