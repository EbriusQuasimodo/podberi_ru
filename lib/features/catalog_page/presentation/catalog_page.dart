import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/product_list/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/product_list/sort_and_filter_buttons_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'catalog_controller.dart';

class CatalogPage extends ConsumerStatefulWidget {
  //final String productType;
  final String whereFrom;

  const CatalogPage(
      {super.key, // required this.productType,
      required this.whereFrom});

  @override
  ConsumerState<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends ConsumerState<CatalogPage> {
  late String productType;
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];
  List<String> selectedBankProducts = [];

  @override
  Widget build(BuildContext context) {
    switch (widget.whereFrom) {
      case "selectProductPage":
        productType = ref.watch(productTypeFromCatalogStateProvider);
        break;
      case "homePage":
        productType = ref.watch(productTypeFromHomeStateProvider);
        break;
      case "allBanksPage":
        productType = 'Каталог';
        break;
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text(productType),
            leading: IconButton(
              onPressed: () {
                // if (widget.whereFrom == AppRoute.allBanksPage.name) {
                //   ref.read(goRouterProvider).pop();
                // }
                ref.read(goRouterProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              padding: EdgeInsets.only(
                  top: widget.whereFrom == AppRoute.allBanksPage.name ? 15 : 0,
                  bottom:
                      widget.whereFrom == AppRoute.allBanksPage.name ? 15 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    widget.whereFrom == AppRoute.allBanksPage.name ? 20 : 14),
                color: ThemeApp.mainWhite,
              ),
              child: widget.whereFrom == AppRoute.allBanksPage.name
                  ? Column(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                          padding: const EdgeInsets.only(
                              top: 15, right: 20, left: 15, bottom: 15),
                          //height: 80,
                          decoration: BoxDecoration(
                              color: ThemeApp.grey,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 9, right: 7, left: 7, bottom: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ThemeApp.mainWhite,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/tinkoff_logo_icon.svg',
                                  height: 32,
                                  width: 36,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Тинькофф банк',
                                style: TextStyle(
                                    color: ThemeApp.backgroundBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                color: ThemeApp.backgroundBlack,
                                size: 20,
                              ),
                              const Text(
                                '4.8',
                                style: TextStyle(
                                    color: ThemeApp.backgroundBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 44,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              itemCount: bankProductsNamesList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: ChoiceChip(
                                      label: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25),
                                            child: Text(
                                                bankProductsNamesList[index]),
                                          ),
                                          selectedBankProducts.contains(
                                                  bankProductsNamesList[index])
                                              ? SvgPicture.asset(
                                                  'assets/icons/delete_icon.svg')
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                                      labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: selectedBankProducts.contains(
                                                  bankProductsNamesList[index])
                                              ? ThemeApp.mainWhite
                                              : ThemeApp.backgroundBlack),
                                      selected: selectedBankProducts.contains(
                                          bankProductsNamesList[index]),
                                      selectedColor: ThemeApp.mainBlue,
                                      backgroundColor: ThemeApp.grey,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0,
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      showCheckmark: false,
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 15),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (value) {
                                            if (!selectedBankProducts.contains(
                                                bankProductsNamesList[index])) {
                                              selectedBankProducts.clear();
                                              selectedBankProducts.add(
                                                  bankProductsNamesList[index]);
                                            }
                                          } else {
                                            selectedBankProducts
                                                .removeWhere((String name) {
                                              return name ==
                                                  bankProductsNamesList[index];
                                            });
                                          }
                                        });
                                      },
                                    ));
                              }),
                        ),
                      ],
                    )
                  : const SortAndfilterButtonsWidget(),
            ),
          ),
          SliverContainer(
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                  child: widget.whereFrom == AppRoute.allBanksPage.name
                      ? const SizedBox.shrink()
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 17),
                          child: Text(
                            'Найдено (132 шт.)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ThemeApp.darkestGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
              sliver: SliverPadding(
                padding: EdgeInsets.only(
                    top: widget.whereFrom == AppRoute.allBanksPage.name
                        ? 15
                        : 47,
                    right: 15,
                    left: 15,
                    bottom: 5),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: 10,
                        (context, index) => const ProductCardWidgetWithButtons(
                            productName: 'Тинькофф Black',
                            productShortDescription:
                                'На остаток - до 5%\nБесплатное обслуживание\nСнятие без % - 500 000 руб.\nДоставка 1-2 дня\nБез овердрафта',
                            productRating: '4.8',
                            bankLogoIconPath:
                                'assets/icons/tinkoff_logo_icon.svg'))),
              )),
        ],
      ),
    );
  }
}
