import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/presentation/favorites_zaimy_controller.dart';

import 'shared_widgets/load_favorites_by_product_type.dart';

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
          categoryName: element,
          selectedCategory: selectedBankProducts,
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
  ScrollController scrollController=ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {  if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      ref.watch(offsetStateProvider.notifier).state +=10;
    }});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () async {
          ref.refresh(favoritesDebitCardsListControllerProvider(
              IsarPaginationParamsModel(offset: -1, limit: -1)).future);
          ref.refresh(favoritesCreditCardsListControllerProvider.future);
          ref.refresh(favoritesZaimyListControllerProvider.future);
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text('Избранное'),
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
           LoadFavoritesByProductType(
                    basicApiPageSettingsModel: BasicApiPageSettingsModel(
                        page: 1,
                        filters: FiltersModel(),
                        productTypeUrl: 'debit_cards'),
                  ),

          ],
        ),
      ),
    );
  }
}
