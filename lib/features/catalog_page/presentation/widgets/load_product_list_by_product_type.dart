import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/bank_product_list_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class LoadProductListByProductType extends ConsumerWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  const LoadProductListByProductType({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (basicApiPageSettingsModel.whereFrom == 'allBanksPage') {
      basicApiPageSettingsModel.productTypeUrl =
          ref.watch(productTypeUrlFromAllBanksStateProvider);
    } else if (basicApiPageSettingsModel.whereFrom == 'homePageBanks') {
      basicApiPageSettingsModel.productTypeUrl =
          ref.watch(productTypeUrlFromHomeBanksStateProvider);
    }
    if (basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return ref
          .watch(debitCardsControllerProvider(basicApiPageSettingsModel))
          .when(data: (debitCards) {
        return debitCards.items.isNotEmpty
            ? BankProductsListWidget(
                basicApiPageSettingsModel: basicApiPageSettingsModel,
                itemsCount: debitCards.itemsCount,
              )
            : SliverStack(
          insetOnOverlap: true,
          children: [
            SliverPositioned.fill(
              child: SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Container(
                  margin: const EdgeInsets.only(top: 2, bottom: 72),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                ),
              ),
            ),
            SliverPositioned.fill(
              child: Center(
                child: OnErrorWidget(
                    error: NothingFoundException().message,
                    onGoBackButtonTap: () {
                      ref.watch(goRouterProvider).pop();
                    },
                    onRefreshButtonTap: () {
                      ref.refresh(debitCardsControllerProvider(
                          basicApiPageSettingsModel));
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text(
                  'Найдено (${debitCards.itemsCount} шт.)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ThemeApp.darkestGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

          ],
        );
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
        return creditCards.items.isNotEmpty
            ? BankProductsListWidget(
                basicApiPageSettingsModel: basicApiPageSettingsModel,
                itemsCount: creditCards.itemsCount,
              )
            : SliverStack(
                insetOnOverlap: true,
                children: [
                  SliverPositioned.fill(
                    child: SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 72),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ThemeApp.mainWhite,
                        ),
                      ),
                    ),
                  ),
                  SliverPositioned.fill(
                    child: Center(
                      child: OnErrorWidget(
                          error: NothingFoundException().message,
                          onGoBackButtonTap: () {
                            ref.watch(goRouterProvider).pop();
                          },
                          onRefreshButtonTap: () {
                            ref.refresh(debitCardsControllerProvider(
                                basicApiPageSettingsModel));
                          }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      child: Text(
                        'Найдено (${creditCards.itemsCount} шт.)',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ThemeApp.darkestGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                ],
              );
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
        return zaimy.items.isNotEmpty
            ? BankProductsListWidget(
                basicApiPageSettingsModel: basicApiPageSettingsModel,
                itemsCount: zaimy.itemsCount,
              )
            : SliverStack(
          insetOnOverlap: true,
          children: [
            SliverPositioned.fill(
              child: SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Container(
                  margin: const EdgeInsets.only(top: 2, bottom: 72),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                ),
              ),
            ),
            SliverPositioned.fill(
              child: Center(
                child: OnErrorWidget(
                    error: NothingFoundException().message,
                    onGoBackButtonTap: () {
                      ref.watch(goRouterProvider).pop();
                    },
                    onRefreshButtonTap: () {
                      ref.refresh(debitCardsControllerProvider(
                          basicApiPageSettingsModel));
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text(
                  'Найдено (${zaimy.itemsCount} шт.)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ThemeApp.darkestGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

          ],
        );
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
        hasScrollBody: false,
        fillOverscroll: true,
        child: OnErrorWidget(
            error: NothingFoundException().message,
            onGoBackButtonTap: () {},
            onRefreshButtonTap: () {}),
      );
    }
  }
}
