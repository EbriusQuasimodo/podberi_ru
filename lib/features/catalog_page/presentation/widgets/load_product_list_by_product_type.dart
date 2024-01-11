import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/bank_product_list_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

class LoadProductListByProductType extends ConsumerWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  const LoadProductListByProductType({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(basicApiPageSettingsModel.whereFrom == 'allBanksPage'){
      basicApiPageSettingsModel.productTypeUrl =ref.watch(productTypeUrlFromAllBanksStateProvider);
    }else if (basicApiPageSettingsModel.whereFrom == 'homePageBanks'){
      basicApiPageSettingsModel.productTypeUrl =ref.watch(productTypeUrlFromHomeBanksStateProvider);
    }
    if (basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return ref
          .watch(debitCardsControllerProvider(basicApiPageSettingsModel))
          .when(data: (debitCards) {
        return debitCards.items.isNotEmpty ? BankProductsListWidget(
          basicApiPageSettingsModel: basicApiPageSettingsModel,
          itemsCount: debitCards.itemsCount,
        )
        :SliverFillRemaining(
          child: OnErrorWidget(
              error: NothingFoundException().message,
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(
                    debitCardsControllerProvider(basicApiPageSettingsModel));
              }),
        );
      }, error: (error, _) {
        return SliverFillRemaining(
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(
                    debitCardsControllerProvider(basicApiPageSettingsModel));
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    } else if (basicApiPageSettingsModel.productTypeUrl == 'credit_cards') {
      return ref
          .watch(creditCardsControllerProvider(basicApiPageSettingsModel))
          .when(data: (creditCards) {
        return creditCards.items.isNotEmpty ? BankProductsListWidget(
          basicApiPageSettingsModel: basicApiPageSettingsModel,
          itemsCount: creditCards.itemsCount,
        )
            :SliverFillRemaining(
              child: OnErrorWidget(
              error: NothingFoundException().message,
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(
                    debitCardsControllerProvider(basicApiPageSettingsModel));
              }),
            );
      }, error: (error, _) {
        return SliverFillRemaining(
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(
                    creditCardsControllerProvider(basicApiPageSettingsModel));
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    } else if (basicApiPageSettingsModel.productTypeUrl == 'zaimy') {
      return ref.watch(zaimyControllerProvider(basicApiPageSettingsModel)).when(
          data: (zaimy) {
        return zaimy.items.isNotEmpty ? BankProductsListWidget(
          basicApiPageSettingsModel: basicApiPageSettingsModel,
          itemsCount: zaimy.itemsCount,
        ) :SliverFillRemaining(
          child: OnErrorWidget(
              error: NothingFoundException().message,
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(
                    debitCardsControllerProvider(basicApiPageSettingsModel));
              }),
        );
      }, error: (error, _) {
        return SliverFillRemaining(
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(
                    debitCardsControllerProvider(basicApiPageSettingsModel));
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
        child: OnErrorWidget(
            error: NothingFoundException().message,
            onGoBackButtonTap: () {},
            onRefreshButtonTap: () {}),
      );
    }
  }
}
