import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/catalog_is_empty.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/debit_cards/presentation/debit_cards_list.dart';
import 'package:podberi_ru/features/catalog_page/credit_cards/presentation/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/zaimy/presentation/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/zaimy/presentation/zaimy_list.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../credit_cards/presentation/credit_cards_list.dart';

class BankProductsListWidget extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///list of banks products. when press on card - go to [LoadDetailsPageByProductType]
  BankProductsListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<BankProductsListWidget> createState() =>
      _BankProductsListWidgetState();
}

class _BankProductsListWidgetState
    extends ConsumerState<BankProductsListWidget> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.basicApiPageSettingsModel.whereFrom == 'allBanksPage') {
      widget.basicApiPageSettingsModel.productTypeUrl =
          ref.watch(productTypeUrlFromAllBanksStateProvider);
    } else if (widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks') {
      widget.basicApiPageSettingsModel.productTypeUrl =
          ref.watch(productTypeUrlFromHomeBanksStateProvider);
    }
    if (widget.basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return ref
          .watch(debitCardsControllerProvider(widget.basicApiPageSettingsModel))
          .when(data: (debitCards) {
        if (widget.basicApiPageSettingsModel.whereFrom ==
                AppRoute.homePage.name ||
            widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks') {
          itemCount = ref.watch(itemsCountFromHomePageStateProvider);
        } else if (widget.basicApiPageSettingsModel.whereFrom ==
                AppRoute.selectProductPage.name ||
            widget.basicApiPageSettingsModel.whereFrom ==
                AppRoute.allBanksPage.name) {
          itemCount =
              ref.watch(itemsCountFromSelectProductPageStateProvider);
        }

        print("list fgklsg ${itemCount}");
        return debitCards.items.isNotEmpty
            ?SliverStack(
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
                  SliverContainer(
                    margin: const EdgeInsets.only(top: 2, bottom: 72),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeApp.mainWhite,
                      ),
                      child: widget.basicApiPageSettingsModel.whereFrom ==
                                  AppRoute.allBanksPage.name ||
                              widget.basicApiPageSettingsModel.whereFrom ==
                                  'homePageBanks'
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 17),
                              child: Text(
                                'Найдено (${itemCount} шт.)',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: ThemeApp.darkestGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                    ),
                    sliver: SliverPadding(
                        padding: EdgeInsets.only(
                          top: widget.basicApiPageSettingsModel.whereFrom ==
                                      AppRoute.allBanksPage.name ||
                                  widget.basicApiPageSettingsModel.whereFrom ==
                                      'homePageBanks'
                              ? 15
                              : 47,
                          right: 15,
                          left: 15,
                          bottom: 5,
                        ),
                        sliver: DebitCardsListWidget(
                          basicApiPageSettingsModel:
                              widget.basicApiPageSettingsModel,
                          itemsCount: itemCount,
                        )),
                  ),
                ],
              )
           : CatalogIsEmpty(itemsCount: itemCount);
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
                ref.refresh(debitCardsControllerProvider( widget.basicApiPageSettingsModel));
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    } else if (widget.basicApiPageSettingsModel.productTypeUrl ==
        'credit_cards') {
      return ref
          .watch(
              creditCardsControllerProvider(widget.basicApiPageSettingsModel))
          .when(data: (creditCards) {
        if (widget.basicApiPageSettingsModel.whereFrom ==
            AppRoute.homePage.name ||
            widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks') {
          itemCount = ref.watch(itemsCountFromHomePageStateProvider);
        } else if (widget.basicApiPageSettingsModel.whereFrom ==
            AppRoute.selectProductPage.name ||
            widget.basicApiPageSettingsModel.whereFrom ==
                AppRoute.allBanksPage.name) {
          itemCount =
              ref.watch(itemsCountFromSelectProductPageStateProvider);
        }
        print("credit ${itemCount}");
        return creditCards.items.isNotEmpty
            ? SliverStack(
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
                  SliverContainer(
                    margin: const EdgeInsets.only(top: 2, bottom: 72),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeApp.mainWhite,
                      ),
                      child: widget.basicApiPageSettingsModel.whereFrom ==
                                  AppRoute.allBanksPage.name ||
                              widget.basicApiPageSettingsModel.whereFrom ==
                                  'homePageBanks'
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 17),
                              child: Text(
                                'Найдено (${itemCount} шт.)',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: ThemeApp.darkestGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                    ),
                    sliver: SliverPadding(
                        padding: EdgeInsets.only(
                          top: widget.basicApiPageSettingsModel.whereFrom ==
                                      AppRoute.allBanksPage.name ||
                                  widget.basicApiPageSettingsModel.whereFrom ==
                                      'homePageBanks'
                              ? 15
                              : 47,
                          right: 15,
                          left: 15,
                          bottom: 5,
                        ),
                        sliver: CreditCardsListWidget(
                          basicApiPageSettingsModel:
                              widget.basicApiPageSettingsModel,
                          itemsCount:  itemCount,
                        )),
                  ),
                ],
              )
            : CatalogIsEmpty(itemsCount: itemCount);
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
                ref.refresh(creditCardsControllerProvider(
                    widget.basicApiPageSettingsModel));
              }),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: CustomLoadingCardWidget(
            bottomPadding: 72,
          ),
        );
      });
    } else if (widget.basicApiPageSettingsModel.productTypeUrl == 'zaimy') {
      return ref
          .watch(zaimyControllerProvider(widget.basicApiPageSettingsModel))
          .when(data: (zaimy) {
        if (widget.basicApiPageSettingsModel.whereFrom ==
            AppRoute.homePage.name ||
            widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks') {
          itemCount = ref.watch(itemsCountFromHomePageStateProvider);
        } else if (widget.basicApiPageSettingsModel.whereFrom ==
            AppRoute.selectProductPage.name ||
            widget.basicApiPageSettingsModel.whereFrom ==
                AppRoute.allBanksPage.name) {
          itemCount =
              ref.watch(itemsCountFromSelectProductPageStateProvider);
        }
        return zaimy.items.isNotEmpty
            ? SliverStack(
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
                  SliverContainer(
                    margin: const EdgeInsets.only(top: 2, bottom: 72),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeApp.mainWhite,
                      ),
                      child: widget.basicApiPageSettingsModel.whereFrom ==
                                  AppRoute.allBanksPage.name ||
                              widget.basicApiPageSettingsModel.whereFrom ==
                                  'homePageBanks'
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 17),
                              child: Text(
                                'Найдено (${itemCount} шт.)',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: ThemeApp.darkestGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                    ),
                    sliver: SliverPadding(
                        padding: EdgeInsets.only(
                          top: widget.basicApiPageSettingsModel.whereFrom ==
                                      AppRoute.allBanksPage.name ||
                                  widget.basicApiPageSettingsModel.whereFrom ==
                                      'homePageBanks'
                              ? 15
                              : 47,
                          right: 15,
                          left: 15,
                          bottom: 5,
                        ),
                        sliver: ZaimyListWidget(
                          basicApiPageSettingsModel:
                              widget.basicApiPageSettingsModel,
                          itemsCount: itemCount,
                        )),
                  ),
                ],
              )
            : CatalogIsEmpty(itemsCount: itemCount);
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
                    zaimyControllerProvider(widget.basicApiPageSettingsModel));
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
