import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BankProductsListAndFilterWidget extends ConsumerStatefulWidget {
  List<ListProductModel> favoritesData;
///пока что перенесено на страницу избранного
  BankProductsListAndFilterWidget({super.key, required this.favoritesData});

  @override
  ConsumerState<BankProductsListAndFilterWidget> createState() =>
      _BankProductsListAndFilterWidgetState();
}

class _BankProductsListAndFilterWidgetState
    extends ConsumerState<BankProductsListAndFilterWidget> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО',
    'Микрозаймы'
  ];

  List<String> selectedBankProducts = [];

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesList) {
      list.add(CustomChoiceChip(
          onTap: () {
            setState(() {});
          },
          element: element,
          selectedBankProducts: selectedBankProducts,
          bankProductsNamesList: bankProductsNamesList,
          whereFrom: 'favorites'));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  void didChangeDependencies() {
    selectedBankProducts.add('Дебетовые карты');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.favoritesData);
    return  SliverStack(
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
            sliver: widget.favoritesData != []
                ? SliverPadding(
                padding: const EdgeInsets.only(
                    top: 90, right: 15, left: 15, bottom: 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: widget.favoritesData.length,
                        (context, index) =>
                        ProductCardWidgetWithButtons(
                          onTap: () {
                            ref.refresh(
                                favoritesListControllerProvider);
                          },
                          productInfo: widget.favoritesData[index],
                          isFavorite: false,
                          basicApiPageSettingsModel:
                          BasicApiPageSettingsModel(
                            productTypeUrl:
                            ref.watch(filterProductUrlStateProvider),
                            pageName: 'Избранное',
                          ),
                          productRating: '4.8',
                        ),
                  ),
                ))
                : SliverToBoxAdapter(
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 57, left: 57),
                    child: Text(
                        'У вас пока нет избранных продуктов'),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 17,
                    ),
                    child: MaterialButton(
                      minWidth:
                      MediaQuery.of(context).size.width -
                          30,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14)),
                      padding: const EdgeInsets.only(
                          top: 17,
                          bottom: 16,
                          left: 75,
                          right: 75),
                      onPressed: () {},
                      color: ThemeApp.mainBlue,
                      child: Text(
                        'В каталог',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ThemeApp.mainWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
