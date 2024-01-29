import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/presentation/comparison_zaimy_controller.dart';

import 'comparison_page_controller.dart';
import 'shared_widgets/load_comparison_by_product_type.dart';

class ComparisonPage extends ConsumerStatefulWidget {
  ///страница сравнения банковских продуктов
  const ComparisonPage({super.key});

  @override
  ConsumerState<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends ConsumerState<ComparisonPage> {
  final List<String> bankProductsNamesListFilter = [
    'Дебетовые карты',
    'Кредитные карты',
    'Микрозаймы',
    'РКО'
  ];

  List<String> selectedBankProductsFilter = ['Дебетовые карты'];

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesListFilter) {
      list.add(CustomChoiceChip(
        whereFrom: 'comparison',
        onTap: () {
          setState(() {});
        },
        categoryName: element,
        selectedCategory: selectedBankProductsFilter,
        bankProductsNamesList: bankProductsNamesListFilter,
      ));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  String firstProductName = '';
  String secondProductName = '';

  @override
  Widget build(BuildContext context) {
    if (ref.watch(comparisonProductUrlStateProvider) == 'debit_cards') {
      firstProductName =
          ref.watch(comparisonFirstDebitProductNameStateProvider);
      secondProductName =
          ref.watch(comparisonSecondDebitProductNameStateController);
    }
    if (ref.watch(comparisonProductUrlStateProvider) == 'credit_cards') {
      firstProductName =
          ref.watch(comparisonFirstCreditProductNameStateProvider);
      secondProductName =
          ref.watch(comparisonSecondCreditProductNameStateController);
    }
    if (ref.watch(comparisonProductUrlStateProvider) == 'zaimy') {
      firstProductName = ref.watch(comparisonFirstZaimyBankNameStateProvider);
      secondProductName =
          ref.watch(comparisonSecondZaimyBankNameStateController);
    }
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () async {
          ref.refresh(comparisonDebitCardsListControllerProvider.future);
          ref.refresh(comparisonCreditCardsListControllerProvider.future);
          ref.refresh(comparisonZaimyListControllerProvider.future);
          //ref.refresh(banksControllerProvider.future);
        },
        child: CustomScrollView(
          slivers: [
            secondProductName == ''
                ? MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: const SliverAppBar(
                      pinned: false,
                      title: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text('Сравнение'),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ))
                : MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: SliverAppBar(
                      pinned: false,
                      title: const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text('Сравнение'),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                    )),
            secondProductName != ''
                ? SliverAppBar(
                    surfaceTintColor: ThemeApp.mainWhite,
                    titleSpacing: 0,
                    toolbarHeight: 54,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 15,
                              bottom: 15,
                              right: secondProductName == '' ? 15 : 0,
                            ),
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                                color: ThemeApp.grey,
                                borderRadius: BorderRadius.circular(14)),
                            child: Center(
                              child: Text(
                                firstProductName,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                    fontFamily: 'Geologica',
                                    color: ThemeApp.backgroundBlack,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 10
                                            : 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        secondProductName != ''
                            ? Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 15,
                                    bottom: 15,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 3),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ThemeApp.grey,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Text(
                                      secondProductName,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: 'Geologica',
                                          color: ThemeApp.backgroundBlack,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? 10
                                              : 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    pinned: true,
                  )
                : const SliverToBoxAdapter(child: SizedBox.shrink()),
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
                        children: list(),
                      )),
                ),
              ),
            ),
            const LoadComparisonByProductType(),
          ],
        ),
      ),
    );
  }
}
