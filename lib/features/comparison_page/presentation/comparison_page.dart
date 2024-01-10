import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_zaimy_controller.dart';

import 'widgets/load_comparison_by_product_type.dart';

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

  String firstProductDescription = '';
  String secondProductDescription = '';

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
        element: element,
        selectedBankProducts: selectedBankProductsFilter,
        bankProductsNamesList: bankProductsNamesListFilter,
      ));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  Widget build(BuildContext context) {
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
            const SliverAppBar(
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
