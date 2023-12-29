import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/bank_product_list_widget.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_zaimy_controller.dart';

class LoadFavoritesByProductType extends ConsumerWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  const LoadFavoritesByProductType({super.key, required this.basicApiPageSettingsModel,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return ref
          .watch(favoritesDebitCardsListControllerProvider)
          .when(data: (debitCards) {
        return BankProductsListWidget(
          basicApiPageSettingsModel: basicApiPageSettingsModel,
          itemsCount: debitCards.itemsCount,
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
        return BankProductsListWidget(
          basicApiPageSettingsModel: basicApiPageSettingsModel,
          itemsCount: creditCards.itemsCount,
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
        return BankProductsListWidget(
          basicApiPageSettingsModel: basicApiPageSettingsModel,
          itemsCount: zaimy.itemsCount,
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