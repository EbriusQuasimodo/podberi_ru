import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/presentation/widgets/bank_poduct_filter_choice_chip_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BankProductsListAndFilterWidget extends StatefulWidget {
  const BankProductsListAndFilterWidget({super.key});

  @override
  State<BankProductsListAndFilterWidget> createState() =>
      _BankProductsListAndFilterWidgetState();
}

class _BankProductsListAndFilterWidgetState
    extends State<BankProductsListAndFilterWidget> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];

  List<String> selectedBankProducts = [];

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesList) {
      list.add(
        BankProductFilterChoiceChipWidget(
          element: element,
          selectedBankProducts: selectedBankProducts,
          bankProductsNamesList: bankProductsNamesList,
          onTap: () {
            setState(() {});
          },
        ),
      );
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SliverStack(
      insetOnOverlap: true,
      children: [
        SliverPositioned.fill(
          child: SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              height: MediaQuery.of(context).size.height - 72,
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
          ),
        ),
        SliverContainer(
          margin: const EdgeInsets.only(bottom: 72, top: 2),
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: list(),
                ),
              ),
            ),
          ),
          sliver: SliverPadding(
            padding:
                const EdgeInsets.only(top: 90, right: 15, left: 15, bottom: 15),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 2,
                (context, index) => const ProductCardWidgetWithButtons(
                  productRating: '4.8',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
