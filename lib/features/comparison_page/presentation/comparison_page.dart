import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/comparison_row_item.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/mini_product_card_widget.dart';

import '../../../core/presentation/expandable_page_view.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];
  List<String> comparisonList = ['Тинькофф', 'Сбербанк', 'ВТБ', 'Газпромбанк'];

  List<String> selectedBankProducts = [];
  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );
  final _controllerSecondPageView = PageController(
    viewportFraction: 0.9,
  );

  double currentPageOnFirstPageView = 0;
  double currentPageOnSecondPageView = 0;

  @override
  void initState() {
    secondProductDescription = comparisonList[0];
    firstProductDescription = comparisonList[0];
    _controllerSecondPageView.addListener(() {
      setState(() {
        currentPageOnSecondPageView =
            _controllerSecondPageView.page!.toDouble();
        secondProductDescription =
            comparisonList[currentPageOnSecondPageView.toInt()];
      });
    });
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPageOnFirstPageView = _controllerBestOffers.page!.toDouble();
        firstProductDescription =
            comparisonList[currentPageOnFirstPageView.toInt()];
      });
    });
    super.initState();
  }

  String firstProductDescription = '';
  String secondProductDescription = '';

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 15)];

    for (var element in bankProductsNamesList) {
      list.add(
        Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: ChoiceChip(
              label: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(element),
                  ),
                  selectedBankProducts.contains(element)
                      ? SvgPicture.asset('assets/icons/delete_icon.svg')
                      : const SizedBox.shrink(),
                ],
              ),
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: selectedBankProducts.contains(element)
                      ? ThemeApp.mainWhite
                      : ThemeApp.backgroundBlack),
              selected: selectedBankProducts.contains(element),
              selectedColor: ThemeApp.mainBlue,
              backgroundColor: ThemeApp.grey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(14),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    if (!selectedBankProducts.contains(element)) {
                      selectedBankProducts.clear();
                      selectedBankProducts.add(element);
                    }
                  } else {
                    selectedBankProducts.removeWhere((String name) {
                      return name == element;
                    });
                  }
                });
              },
            )),
      );
    }
    list.add(const SizedBox(
      width: 15,
    ));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Сравнение'),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 18, bottom: 18),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: list,
                    )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30, left: 15, right: 15),
                    child: Text(
                      'Продукты в сравнении',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ThemeApp.backgroundBlack),
                    ),
                  ),
                  ExpandablePageView(
                    pageController: _controllerBestOffers,
                    children: List.generate(comparisonList.length, (index) {
                      return MiniProductCardWidget(
                        bankName: comparisonList[index],
                        onDelete: () {
                          setState(() {
                            comparisonList.removeAt(index);
                            _controllerBestOffers.animateToPage(index - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                            if (_controllerBestOffers.page ==
                                _controllerSecondPageView.page) {
                              _controllerSecondPageView.animateToPage(index - 1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          });
                        },
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        comparisonList.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            alignment: Alignment.centerLeft,
                            height:
                                currentPageOnFirstPageView == index ? 10 : 8,
                            width: currentPageOnFirstPageView == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPageOnFirstPageView == index
                                  ? ThemeApp.backgroundBlack
                                  : ThemeApp.darkestGrey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  comparisonList.length == 1
                      ? SizedBox.shrink()
                      : ExpandablePageView(
                          children:
                              List.generate(comparisonList.length, (index) {
                            return MiniProductCardWidget(
                              bankName: comparisonList[index],
                              onDelete: () {
                                setState(() {
                                  comparisonList.removeAt(index);
                                  _controllerSecondPageView.animateToPage(
                                      index - 1,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                  if (_controllerBestOffers.page ==
                                      _controllerSecondPageView.page) {
                                    _controllerBestOffers.animateToPage(
                                        index - 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                  }
                                });
                              },
                            );
                          }),
                          pageController: _controllerSecondPageView,
                        ),
                  comparisonList.length == 1
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(top: 11, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              comparisonList.length,
                              (index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  alignment: Alignment.centerLeft,
                                  height: currentPageOnSecondPageView == index
                                      ? 10
                                      : 8,
                                  width: currentPageOnSecondPageView == index
                                      ? 10
                                      : 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentPageOnSecondPageView == index
                                        ? ThemeApp.backgroundBlack
                                        : ThemeApp.darkestGrey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 43, bottom: 30),
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
                    secondProductDescription: 'UnionPay',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Тип карты',
                    firstProductDescription: 'Классическая',
                    secondProductDescription: 'Classic / Gold / Platinum',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Валюта карты',
                    firstProductDescription: 'Рубль, доллар, евро +27',
                    secondProductDescription: 'Рубль, доллар, евро',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Срок действия',
                    firstProductDescription: '8 лет',
                    secondProductDescription: '5 лет',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Кэшбек',
                    firstProductDescription:
                        '2% или 5% на отдельные категории расходов',
                    secondProductDescription:
                        'От 1% до 15% на четыре выбранные категории\nОт 3% до 30% на предложения партнеров',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Стоимость обслуживания',
                    firstProductDescription:
                        '0 руб. при наличии на вкладах или счетах от 50 000 ₽\n0 руб. при наличии кредита\n99 руб. в мес. в прочих случаях',
                    secondProductDescription:
                        'Бесплатно\nВыпуск карты - 5000 руб. Эту плату можно вернуть полностью или частично:- 5000 рублей, если в течение трех месяцев подряд (в период первых 4 месяцев) после получения карты тратить на покупки от 50 000 в месяц;- 3000 рублей, если в течение первых трех месяцев тратить на покупки от 10 000 в месяц',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Снятие наличных',
                    firstProductDescription:
                        '0 руб. при снятии в банкоматах Тинькофф (до 500 000 ₽ в месяц)\n0 руб. при снятии от 3000 до 100 000 руб. за расч. период в сторонних банкоматах\n90 руб. при снятии до 3000 руб.2% мин\n90 руб. при снятии от 100 000 руб. в сторонних банкоматах за расч. период',
                    secondProductDescription:
                        'Бесплатно в банкоматах Газпромбанка до 1 млн рублей в месяц\n- Бесплатно через сторонние банкоматы до 200 000 рублей в месяц \n- 1%, мин. 300 руб. - в прочих случаях',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Перевод средств',
                    firstProductDescription:
                        '0 руб. внутренний банковский перевод\n0 руб. перевод по системе СБП',
                    secondProductDescription:
                        '- 0 руб. внутри банка- 1,5%, мин.\n50 руб. по номеру карты в сторонние банки\nЧерез СБП: \n- 0 руб. в до 100 000 руб./мес. \n- 0,5%, максимум 1500 руб., если более 100 000 руб./мес.',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Процент на остаток',
                    firstProductDescription:
                        '5% годовых на остаток до 300 000 руб. при сумме покупок от 3000 руб. за расчетный период и при подключенном сервисе Tinkoff Pro/Premium/PrivateВ прочих случаях не начисляется',
                    secondProductDescription:
                        'До 13.5% годовых по накопительному счету',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Доставка',
                    firstProductDescription: 'Курьером или по почте',
                    secondProductDescription:
                        'Бесплатная доставка или получение в офисе в день обращения',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Срок доставки',
                    firstProductDescription: '1-2 дня',
                    secondProductDescription: '1-2 дня',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Овердрафт',
                    firstProductDescription:
                        'Есть, расчитывается индивидуально',
                    secondProductDescription:
                        'Бесплатно 7 дней\n0,1% в день далее',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Приложение',
                    firstProductDescription: 'Бесплатно\niOS, Android',
                    secondProductDescription: 'Бесплатно\niOS, Android',
                  ),
                  ComparisonRowItemWidget(
                    rowName: 'Смс-информирование',
                    firstProductDescription: '59 руб. в месяц',
                    secondProductDescription:
                        '99 руб./мес.\nБесплатно первые 2 месяца',
                  ),
                  ComparisonRowItemWidget(
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
                            child: Text(
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
                            child: Text(
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
          ),
        ],
      ),
    );
  }
}
