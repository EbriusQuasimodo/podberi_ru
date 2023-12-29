import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';

import '../comparison_row_item.dart';


class CreditCardsComparisonDataTableWidget extends ConsumerStatefulWidget {

  ///таблица сравнения двух кредиток, используется в [ComparisonPage]
  const CreditCardsComparisonDataTableWidget({
    super.key,

  });

  @override
  ConsumerState<CreditCardsComparisonDataTableWidget> createState() => _CreditCardsComparisonDataTableWidgetState();
}

class _CreditCardsComparisonDataTableWidgetState extends ConsumerState<CreditCardsComparisonDataTableWidget> {
  @override
  Widget build(BuildContext context) {
    String firstProductDescription = ref.watch(comparisonFirstCreditBankNameStateProvider);
    String secondProductDescription = ref.watch(comparisonSecondCreditBankNameStateController);
    return Container(
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
          ComparisonRowItemWidget(
            rowName: 'Платежная система',
            firstProductDescription: 'Мир, MasterCard',
            secondProductDescription: secondProductDescription != '' ?'UnionPay' :'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Тип карты',
            firstProductDescription: 'Классическая',
            secondProductDescription: secondProductDescription != '' ?'Classic / Gold / Platinum':'',
          ),
         ComparisonRowItemWidget(
            rowName: 'Валюта карты',
            firstProductDescription: 'Рубль, доллар, евро +27',
            secondProductDescription: secondProductDescription != '' ?'Рубль, доллар, евро':'',
          ),
         ComparisonRowItemWidget(
            rowName: 'Срок действия',
            firstProductDescription: '8 лет',
            secondProductDescription: secondProductDescription != '' ?'5 лет':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Кэшбек',
            firstProductDescription:
                '2% или 5% на отдельные категории расходов',
            secondProductDescription:
            secondProductDescription != '' ? 'От 1% до 15% на четыре выбранные категории\nОт 3% до 30% на предложения партнеров':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Стоимость обслуживания',
            firstProductDescription:
                '0 руб. при наличии на вкладах или счетах от 50 000 ₽\n0 руб. при наличии кредита\n99 руб. в мес. в прочих случаях',
            secondProductDescription:
            secondProductDescription != '' ? 'Бесплатно\nВыпуск карты - 5000 руб. Эту плату можно вернуть полностью или частично:- 5000 рублей, если в течение трех месяцев подряд (в период первых 4 месяцев) после получения карты тратить на покупки от 50 000 в месяц;- 3000 рублей, если в течение первых трех месяцев тратить на покупки от 10 000 в месяц':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Снятие наличных',
            firstProductDescription:
                '0 руб. при снятии в банкоматах Тинькофф (до 500 000 ₽ в месяц)\n0 руб. при снятии от 3000 до 100 000 руб. за расч. период в сторонних банкоматах\n90 руб. при снятии до 3000 руб.2% мин\n90 руб. при снятии от 100 000 руб. в сторонних банкоматах за расч. период',
            secondProductDescription:
            secondProductDescription != '' ?  'Бесплатно в банкоматах Газпромбанка до 1 млн рублей в месяц\n- Бесплатно через сторонние банкоматы до 200 000 рублей в месяц \n- 1%, мин. 300 руб. - в прочих случаях':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Перевод средств',
            firstProductDescription:
                '0 руб. внутренний банковский перевод\n0 руб. перевод по системе СБП',
            secondProductDescription:
            secondProductDescription != '' ?   '- 0 руб. внутри банка- 1,5%, мин.\n50 руб. по номеру карты в сторонние банки\nЧерез СБП: \n- 0 руб. в до 100 000 руб./мес. \n- 0,5%, максимум 1500 руб., если более 100 000 руб./мес.':'',
          ),
           ComparisonRowItemWidget(
            rowName: 'Процент на остаток',
            firstProductDescription:
                '5% годовых на остаток до 300 000 руб. при сумме покупок от 3000 руб. за расчетный период и при подключенном сервисе Tinkoff Pro/Premium/PrivateВ прочих случаях не начисляется',
            secondProductDescription:
            secondProductDescription != '' ?    'До 13.5% годовых по накопительному счету':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Доставка',
            firstProductDescription: 'Курьером или по почте',
            secondProductDescription:
            secondProductDescription != '' ?   'Бесплатная доставка или получение в офисе в день обращения':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Срок доставки',
            firstProductDescription: '1-2 дня',
            secondProductDescription:secondProductDescription != '' ? '1-2 дня':'',
          ),
           ComparisonRowItemWidget(
            rowName: 'Овердрафт',
            firstProductDescription: 'Есть, расчитывается индивидуально',
            secondProductDescription:secondProductDescription != '' ? 'Бесплатно 7 дней\n0,1% в день далее':'',
          ),
           ComparisonRowItemWidget(
            rowName: 'Приложение',
            firstProductDescription: 'Бесплатно\niOS, Android',
            secondProductDescription: secondProductDescription != '' ?'Бесплатно\niOS, Android':'',
          ),
          ComparisonRowItemWidget(
            rowName: 'Смс-информирование',
            firstProductDescription: '59 руб. в месяц',
            secondProductDescription:
            secondProductDescription != '' ?'99 руб./мес.\nБесплатно первые 2 месяца':'',
          ),
           ComparisonRowItemWidget(
            rowName: 'Дополнительно',
            firstProductDescription:
                'Условия дебетовой карты Tinkoff Black с подпиской Tinkoff Pro становятся выгоднее.',
            secondProductDescription: secondProductDescription != '' ?'-' :'',
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
              secondProductDescription != '' ?
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
              )
                  :SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}