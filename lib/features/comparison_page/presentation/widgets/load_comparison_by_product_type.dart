import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
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
                : SliverFillRemaining(
              child: Container(
                margin: const EdgeInsets.only(top: 2, bottom: 72),
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
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(comparisonDebitCardsListControllerProvider);
            });
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
                : SliverFillRemaining(
              child: Container(
                margin: const EdgeInsets.only(top: 2, bottom: 72),
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
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(comparisonCreditCardsListControllerProvider);
            });
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
                : SliverFillRemaining(
              child: Container(
                margin: const EdgeInsets.only(top: 2, bottom: 72),
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
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(comparisonZaimyListControllerProvider);
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
