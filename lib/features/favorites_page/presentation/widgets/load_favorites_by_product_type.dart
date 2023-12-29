import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/bank_product_list_widget.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_zaimy_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/widgets/debit_cards/favorites_debit_cards_list_widget.dart';

import 'credit_cards/favorites_credit_cards_list_widget.dart';
import 'zaimy/favorites_zaimy_list_widget.dart';

class LoadFavoritesByProductType extends ConsumerWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  const LoadFavoritesByProductType({super.key, required this.basicApiPageSettingsModel,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return ref
          .watch(favoritesDebitCardsListControllerProvider)
          .when(data: (debitCards) {
        return debitCards.items.isNotEmpty
            ?FavoritesDebitCardsList(
          itemsCount: debitCards.itemsCount,

        ) : SliverFillRemaining(
          child: Container(
            margin: const EdgeInsets.only(top: 72, bottom: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: Column(
              children: [
                Spacer(),
                const Padding(
                  padding: const EdgeInsets.only(right: 57, left: 57),
                  child: Text(
                    'У вас пока нет продуктов в сравнении по данной категории.',
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
                    onPressed: () {},
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
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(favoritesDebitCardsListControllerProvider);
            });
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    }else if(basicApiPageSettingsModel.productTypeUrl =='credit_cards'){
      return ref
          .watch(favoritesCreditCardsListControllerProvider)
          .when(data: (creditCards) {
        return creditCards.items.isNotEmpty
            ?FavoritesCreditCardsList(
          itemsCount: creditCards.itemsCount,

        ) : SliverFillRemaining(
          child: Container(
            margin: const EdgeInsets.only(top: 72, bottom: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: Column(
              children: [
                Spacer(),
                const Padding(
                  padding: const EdgeInsets.only(right: 57, left: 57),
                  child: Text(
                    'У вас пока нет продуктов в сравнении по данной категории.',
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
                    onPressed: () {},
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
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(favoritesCreditCardsListControllerProvider);
            });
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    }else{
      return ref
          .watch(favoritesZaimyListControllerProvider)
          .when(data: (zaimy) {
        return zaimy.items.isNotEmpty
            ?FavoritesZaimyList(
          itemsCount: zaimy.itemsCount,

        ) : SliverFillRemaining(
          child: Container(
            margin: const EdgeInsets.only(top: 72, bottom: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: Column(
              children: [
                Spacer(),
                const Padding(
                  padding: const EdgeInsets.only(right: 57, left: 57),
                  child: Text(
                    'У вас пока нет продуктов в сравнении по данной категории.',
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
                    onPressed: () {},
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
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(favoritesZaimyListControllerProvider);
            });
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    }

  }
}