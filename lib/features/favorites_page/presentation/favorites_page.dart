import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/presentation/widgets/load_favorites_by_product_type.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'controllers/favorites_credit_cards_controller.dart';
import 'controllers/favorites_debit_cards_controller.dart';
import 'controllers/favorites_zaimy_controller.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  ///страница избранного
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
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

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () async {
          ref.refresh(favoritesDebitCardsListControllerProvider.future);
          ref.refresh(favoritesCreditCardsListControllerProvider.future);
          ref.refresh(favoritesZaimyListControllerProvider.future);
        },
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text('Избранное'),
            ),
            SliverStack(
              insetOnOverlap: true,
              children: [
                SliverPositioned.fill(
                  child: SliverFillRemaining(
                    fillOverscroll: true,
                    child: Container(
                      margin: const EdgeInsets.only(top: 2, bottom: 72),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeApp.mainWhite,
                      ),
                    ),
                  ),
                ),
                SliverContainer(
                  margin: const EdgeInsets.only(top: 2),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                  sliver: LoadFavoritesByProductType(
                    basicApiPageSettingsModel: BasicApiPageSettingsModel(
                        productTypeUrl: 'debit_cards'),
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
