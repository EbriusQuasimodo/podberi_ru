import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_zaimy_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/credit_cards/comparison_credit_cards_widget.dart';

import 'debit_cards/comparison_debit_cards_widget.dart';
import 'zaimy/comparison_zaimy_widget.dart';

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
                ? ComparisonDebitCardsWidget(
              debitCardsInComparison: debitCardsInComparison.items,
              onScrollPageViews: () {
                setState(() {});
              },
            )
                : FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в сравнении по данной категории.',);
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
                ? ComparisonCreditCardsWidget(
              creditCardsInComparison: creditCardsInComparison.items,
              onScrollPageViews: () {
                setState(() {});
              },
            )
                : FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в сравнении по данной категории.',);
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
                ? ComparisonZaimyWidget(
              zaimyInComparison: zaimyInComparison.items,
              onScrollPageViews: () {
                setState(() {});
              },
            )
                : FavoritesOrComparisonIsEmpty(error: 'У вас пока нет продуктов в сравнении по данной категории.',);
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
