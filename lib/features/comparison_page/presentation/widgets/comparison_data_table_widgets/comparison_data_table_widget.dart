import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

import 'comparison_row_item.dart';

class ComparisonDataTableWidget extends StatelessWidget {
  final String firstProductDescription;
  final String secondProductDescription;

  const ComparisonDataTableWidget({
    super.key,
    required this.firstProductDescription,
    required this.secondProductDescription,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 43, bottom: 30),
        margin: const EdgeInsets.only(top: 2, bottom: 72),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            ComparisonRowItemWidget(
              rowName: 'Банк',
              firstProductDescription: firstProductDescription,
              secondProductDescription: secondProductDescription,
            ),
            const ComparisonRowItemWidget(
              rowName: 'Платежная система',
              firstProductDescription: 'Мир, MasterCard',
              secondProductDescription: 'UnionPay',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Тип карты',
              firstProductDescription: 'Классическая',
              secondProductDescription: 'Classic / Gold / Platinum',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Валюта карты',
              firstProductDescription: 'Рубль, доллар, евро +27',
              secondProductDescription: 'Рубль, доллар, евро',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Срок действия',
              firstProductDescription: '8 лет',
              secondProductDescription: '5 лет',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Кэшбек',
              firstProductDescription:
                  '2% или 5% на отдельные категории расходов',
              secondProductDescription:
                  'От 1% до 15% на четыре выбранные категории\nОт 3% до 30% на предложения партнеров',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Стоимость обслуживания',
              firstProductDescription:
                  '0 руб. при наличии на вкладах или счетах от 50 000 ₽\n0 руб. при наличии кредита\n99 руб. в мес. в прочих случаях',
              secondProductDescription:
                  'Бесплатно\nВыпуск карты - 5000 руб. Эту плату можно вернуть полностью или частично:- 5000 рублей, если в течение трех месяцев подряд (в период первых 4 месяцев) после получения карты тратить на покупки от 50 000 в месяц;- 3000 рублей, если в течение первых трех месяцев тратить на покупки от 10 000 в месяц',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Снятие наличных',
              firstProductDescription:
                  '0 руб. при снятии в банкоматах Тинькофф (до 500 000 ₽ в месяц)\n0 руб. при снятии от 3000 до 100 000 руб. за расч. период в сторонних банкоматах\n90 руб. при снятии до 3000 руб.2% мин\n90 руб. при снятии от 100 000 руб. в сторонних банкоматах за расч. период',
              secondProductDescription:
                  'Бесплатно в банкоматах Газпромбанка до 1 млн рублей в месяц\n- Бесплатно через сторонние банкоматы до 200 000 рублей в месяц \n- 1%, мин. 300 руб. - в прочих случаях',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Перевод средств',
              firstProductDescription:
                  '0 руб. внутренний банковский перевод\n0 руб. перевод по системе СБП',
              secondProductDescription:
                  '- 0 руб. внутри банка- 1,5%, мин.\n50 руб. по номеру карты в сторонние банки\nЧерез СБП: \n- 0 руб. в до 100 000 руб./мес. \n- 0,5%, максимум 1500 руб., если более 100 000 руб./мес.',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Процент на остаток',
              firstProductDescription:
                  '5% годовых на остаток до 300 000 руб. при сумме покупок от 3000 руб. за расчетный период и при подключенном сервисе Tinkoff Pro/Premium/PrivateВ прочих случаях не начисляется',
              secondProductDescription:
                  'До 13.5% годовых по накопительному счету',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Доставка',
              firstProductDescription: 'Курьером или по почте',
              secondProductDescription:
                  'Бесплатная доставка или получение в офисе в день обращения',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Срок доставки',
              firstProductDescription: '1-2 дня',
              secondProductDescription: '1-2 дня',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Овердрафт',
              firstProductDescription: 'Есть, расчитывается индивидуально',
              secondProductDescription: 'Бесплатно 7 дней\n0,1% в день далее',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Приложение',
              firstProductDescription: 'Бесплатно\niOS, Android',
              secondProductDescription: 'Бесплатно\niOS, Android',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Смс-информирование',
              firstProductDescription: '59 руб. в месяц',
              secondProductDescription:
                  '99 руб./мес.\nБесплатно первые 2 месяца',
            ),
            const ComparisonRowItemWidget(
              rowName: 'Дополнительно',
              firstProductDescription:
                  'Условия дебетовой карты Tinkoff Black с подпиской Tinkoff Pro становятся выгоднее.',
              secondProductDescription: '-',
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 3),
                    child: MaterialButton(
                      onPressed: () {},
                      color: ThemeApp.mainBlue,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        'Оформить',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ThemeApp.mainWhite),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 3),
                    child: MaterialButton(
                      onPressed: () {},
                      height: 50,
                      color: ThemeApp.mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        'Оформить',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ThemeApp.mainWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}