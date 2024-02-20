import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/rko/presentation/favorites_rko_controller.dart';
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
            ref.watch(favoritesDebitCardsListStateProvider.notifier).state.clear();
            ref.invalidate(favoritesDebitCardsListControllerProvider);
            ref.watch(favoritesCreditCardsListStateProvider.notifier).state.clear();
            ref.invalidate(favoritesCreditCardsListControllerProvider);
            ref.watch(favoritesZaimyListStateProvider.notifier).state.clear();
            ref.invalidate(favoritesZaimyListControllerProvider);
            ref.watch(favoritesRkoListStateProvider.notifier).state.clear();
            ref.invalidate(favoritesRkoListControllerProvider);
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
  final GlobalKey key = GlobalKey();
  Size? redboxSize;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        redboxSize = getRedBoxSize(key.currentContext!);
      });
    });
    super.initState();
  }
  final isar = Isar.getInstance();
  Size getRedBoxSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () async {
          ref.invalidate(favoritesDebitCardsListControllerProvider);
          ref.invalidate(favoritesCreditCardsListControllerProvider);
          ref.invalidate(favoritesZaimyListControllerProvider);
          ref.invalidate(favoritesRkoListControllerProvider);
        },
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text('Избранное'),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: key,
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
             choiceChipSize: redboxSize,
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
