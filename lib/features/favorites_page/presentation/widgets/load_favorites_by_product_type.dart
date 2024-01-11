import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_zaimy_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/widgets/debit_cards/favorites_debit_cards_list_widget.dart';

import 'credit_cards/favorites_credit_cards_list_widget.dart';
import 'zaimy/favorites_zaimy_list_widget.dart';

class LoadFavoritesByProductType extends ConsumerWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  ///виджет для загрузки списка избранного по выбранному типу продукта
  const LoadFavoritesByProductType({super.key, required this.basicApiPageSettingsModel,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(basicApiPageSettingsModel.productTypeUrl);
    if (ref.watch(favoritesProductUrlStateProvider) ==  'debit_cards') {
      return ref
          .watch(favoritesDebitCardsListControllerProvider)
          .when(data: (debitCards) {
        return debitCards.items.isNotEmpty
            ?FavoritesDebitCardsList(
          itemsCount: debitCards.itemsCount,

        ) : SliverFillRemaining(
          child: Container(
            margin: const EdgeInsets.only(top: 90,  bottom: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
             // color: ThemeApp.mainWhite,
            ),
            child: Column(
              children: [
                Spacer(),
                const Padding(
                  padding: const EdgeInsets.only(right: 57, left: 57),
                  child: Text(
                    'У вас пока нет продуктов в избранном по данной категории.',
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 17,
                  ),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 16, left: 75, right: 75),
                    onPressed: () { ref
                        .watch(goRouterProvider)
                        .go(RouteConstants.selectProduct);},
                    color: ThemeApp.mainBlue,
                    child: const Text(
                      'В каталог',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ThemeApp.mainWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }, error: (error, _) {
        return SliverFillRemaining(
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(favoritesDebitCardsListControllerProvider);
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    }else if(ref.watch(favoritesProductUrlStateProvider) ==  'credit_cards'){
      return ref
          .watch(favoritesCreditCardsListControllerProvider)
          .when(data: (creditCards) {
        return creditCards.items.isNotEmpty
            ?FavoritesCreditCardsList(
          itemsCount: creditCards.itemsCount,

        ) : SliverFillRemaining(
          child: Container(
            margin: const EdgeInsets.only(top: 90, bottom: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Spacer(),
                const Padding(
                  padding: const EdgeInsets.only(right: 57, left: 57),
                  child: Text(
                    'У вас пока нет продуктов в избранном по данной категории.',
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 17,
                  ),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 16, left: 75, right: 75),
                    onPressed: () { ref
                        .watch(goRouterProvider)
                        .go(RouteConstants.selectProduct);},
                    color: ThemeApp.mainBlue,
                    child: const Text(
                      'В каталог',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ThemeApp.mainWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }, error: (error, _) {
        return SliverFillRemaining(
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.refresh(favoritesCreditCardsListControllerProvider);
              },
              onRefreshButtonTap: () {
                ref.refresh(favoritesCreditCardsListControllerProvider);
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    }else if (ref.watch(favoritesProductUrlStateProvider) ==  'zaimy'){
      return ref
          .watch(favoritesZaimyListControllerProvider)
          .when(data: (zaimy) {
        return zaimy.items.isNotEmpty
            ?FavoritesZaimyList(
          itemsCount: zaimy.itemsCount,

        ) : SliverFillRemaining(
          child: Container(
            margin: const EdgeInsets.only(top: 90, bottom: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Spacer(),
                const Padding(
                  padding: const EdgeInsets.only(right: 57, left: 57),
                  child: Text(
                    'У вас пока нет продуктов в избранном по данной категории.',
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 17,
                  ),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 16, left: 75, right: 75),
                    onPressed: () { ref
                        .watch(goRouterProvider)
                        .go(RouteConstants.selectProduct);},
                    color: ThemeApp.mainBlue,
                    child: const Text(
                      'В каталог',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ThemeApp.mainWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }, error: (error, _) {
        return SliverFillRemaining(
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.refresh(favoritesCreditCardsListControllerProvider);
              },
              onRefreshButtonTap: () {
                ref.refresh(favoritesZaimyListControllerProvider);
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    }else{
      return SliverFillRemaining(child: OnErrorWidget(error: NothingFoundException().message, onGoBackButtonTap: (){}, onRefreshButtonTap: (){}));

    }

  }
}