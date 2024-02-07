import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/presentation/comparison_zaimy_controller.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_page.dart';

import '../../debit_cards/presentation/comparison_debit_cards_page.dart';
import '../../zaimy/presentation/comparison_zaimy_page.dart';

class LoadComparisonByProductType extends ConsumerStatefulWidget {
  const LoadComparisonByProductType({super.key});

  @override
  ConsumerState<LoadComparisonByProductType> createState() => _LoadWidgetByProductTypeState();
}

class _LoadWidgetByProductTypeState extends ConsumerState<LoadComparisonByProductType> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(comparisonProductUrlStateProvider) == 'debit_cards') {
      return ref.watch(comparisonDebitCardsListControllerProvider).when(
          data: (debitCardsInComparison) {

            return debitCardsInComparison.items.isNotEmpty
                ? ComparisonDebitCardsPage(
              debitCardsInComparison: debitCardsInComparison.items,
              onScrollPageViews: () {
                setState(() {});
              },
            )
                : const FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в сравнении по данной категории.',);
          }, error: (error, _) {
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(comparisonDebitCardsListControllerProvider);
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    } else if (ref.watch(comparisonProductUrlStateProvider) == 'credit_cards') {
      return ref.watch(comparisonCreditCardsListControllerProvider).when(
          data: (creditCardsInComparison) {
            return creditCardsInComparison.items.isNotEmpty
                ? ComparisonCreditCardsPage(
              creditCardsInComparison: creditCardsInComparison.items,
              onScrollPageViews: () {
                setState(() {});
              },
            )
                : const FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в сравнении по данной категории.',);
          }, error: (error, _) {
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(comparisonCreditCardsListControllerProvider);
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
      return ref.watch(comparisonZaimyListControllerProvider).when(
          data: (zaimyInComparison) {
            return zaimyInComparison.items.isNotEmpty
                ? ComparisonZaimyPage(
              zaimyInComparison: zaimyInComparison.items,
              onScrollPageViews: () {
                setState(() {});
              },
            )
                : const FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в сравнении по данной категории.',);
          }, error: (error, _) {
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(comparisonZaimyListControllerProvider);
              }),
        );
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
