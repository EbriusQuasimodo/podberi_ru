import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/row_description_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );

  double currentPage = 0;

  @override
  void initState() {
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPage = _controllerBestOffers.page!.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Детали'),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2),
              padding: const EdgeInsets.only(top: 30, bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: Text(
                      'Тинькофф Black Super Premium Ultra Gaming 3000',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  ExpandablePageView(
                      physics: const BouncingScrollPhysics(),
                      controller: _controllerBestOffers,
                      children: [
                        Image.asset('assets/images/product_photo.png'),
                        Image.asset('assets/images/product_photo.png'),
                        Image.asset('assets/images/product_photo.png'),
                        Image.asset('assets/images/product_photo.png'),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            alignment: Alignment.centerLeft,
                            height: currentPage == index ? 10 : 8,
                            width: currentPage == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPage == index
                                  ? ThemeApp.backgroundBlack
                                  : ThemeApp.darkestGrey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6, left: 15),
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Заказать карту',
                              style: TextStyle(
                                  color: ThemeApp.mainWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            color: ThemeApp.mainBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(14),
                        color: ThemeApp.grey,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: SvgPicture.asset(
                              'assets/icons/nav_bar_icons/favorites_page.svg',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, right: 15),
                        child: Material(
                          borderRadius: BorderRadius.circular(14),
                          color: ThemeApp.grey,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset(
                                'assets/icons/nav_bar_icons/comparison_page.svg',
                                height: 24,
                                width: 24,
                              ),
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
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 21, bottom: 22, left: 15, right: 15),
                child: Text(
                  'Есть возможность кастомизации дизайна',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeApp.mainBlue),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeApp.grey,
                        ),
                        height: 60,
                        margin: EdgeInsets.only(
                            top: 15, left: 15, right: 6, bottom: 30),
                        padding: EdgeInsets.only(
                            top: 10.5, bottom: 11.5, right: 8.63, left: 9.16),
                        child: SvgPicture.asset(
                          'assets/icons/tinkoff_logo_icon.svg',
                          height: 37.921,
                          width: 42.208,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeApp.grey,
                            ),
                            height: 60,
                            margin:
                                EdgeInsets.only(top: 15, right: 15, bottom: 30),
                            padding: EdgeInsets.only(
                                top: 22, bottom: 21, right: 15, left: 15),
                            child: Text(
                              'Тинькофф Банк',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ThemeApp.backgroundBlack),
                            )),
                      ),
                    ],
                  ),
                  RowDescriptionWidget(
                      rowDescription: 'Мир, MasterCard',
                      rowName: 'Платежная система'),
                  RowDescriptionWidget(
                      rowDescription: 'Классическая', rowName: 'Тип карты'),
                  RowDescriptionWidget(
                      rowDescription: 'Рубль, доллар, евро, +27',
                      rowName: 'Валюта карты'),
                  RowDescriptionWidget(
                      rowDescription: '8 лет', rowName: 'Срок действия'),
                  RowDescriptionWidget(
                      rowDescription: '1-2 дня', rowName: 'Доставка'),
                  RowDescriptionWidget(
                      rowDescription: 'Курьером или почтой',
                      rowName: 'Способ доставки'),
                  RowDescriptionWidget(
                      rowDescription: 'Есть, рассчитывается индивидуально',
                      rowName: 'Овердрафт'),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 24),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          child: Text(
                            'Показать все',
                            style: TextStyle(
                                color: ThemeApp.backgroundBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2, bottom: 72),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
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
          ),
        ],
      ),
    );
  }
}
