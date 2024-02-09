import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_list_widget.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/presentation/favorites_zaimy_controller.dart';

import '../../credit_cards/presentation/favorites_credit_cards_list_widget.dart';
import '../../zaimy/presentation/favorites_zaimy_list_widget.dart';

class LoadFavoritesByProductType extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///виджет для загрузки списка избранного по выбранному типу продукта
  LoadFavoritesByProductType({
    super.key,
    required this.basicApiPageSettingsModel,
  });
  @override
  ConsumerState<LoadFavoritesByProductType> createState() => _LoadFavoritesByProductTypeState();
}

class _LoadFavoritesByProductTypeState extends ConsumerState<LoadFavoritesByProductType> {

  @override
  Widget build(BuildContext context) {
    if (ref.watch(favoritesProductUrlStateProvider) == 'debit_cards') {

      return ref
          .watch(favoritesDebitCardsListControllerProvider(IsarPaginationParamsModel(offset:-1, limit: -1))).when(data: (debitCards) {
           int itemsCount = ref.watch(itemsCountFavoritesStateProvider);
        return debitCards.items.isNotEmpty
          ? FavoritesDebitCardsList(
          itemsCount:debitCards.itemsCount,

        )
    : const FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в избранном по данной категории.',);
      }, error: (error, _) {
            print(_);
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(favoritesDebitCardsListControllerProvider(IsarPaginationParamsModel(offset: -1, limit: -1)));
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    } else if (ref.watch(favoritesProductUrlStateProvider) == 'credit_cards') {
      return ref.watch(favoritesCreditCardsListControllerProvider).when(
          data: (creditCards) {
        return creditCards.items.isNotEmpty
            ? FavoritesCreditCardsList(
                itemsCount: creditCards.itemsCount,
              )
            : const FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в избранном по данной категории.',);
      }, error: (error, _) {
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
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
    } else if (ref.watch(favoritesProductUrlStateProvider) == 'zaimy') {
      return ref.watch(favoritesZaimyListControllerProvider).when(
          data: (zaimy) {
        return zaimy.items.isNotEmpty
            ? FavoritesZaimyList(
                itemsCount: zaimy.itemsCount,
              )
            : const FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в избранном по данной категории.',);
      }, error: (error, _) {
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
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
    } else {
      return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: OnErrorWidget(
              error: NothingFoundException().message,
              onGoBackButtonTap: () {},
              onRefreshButtonTap: () {}));
    }
  }
}
