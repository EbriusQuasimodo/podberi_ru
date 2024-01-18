import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/presentation/custom_app_bar_with_search.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/product_type_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SelectProductTypePage extends ConsumerWidget {
  ///страница выбора типа продукта (категории продукта)
  SelectProductTypePage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Каталог',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
          CustomAppBarWithSearch(controller: searchController),
          SliverStack(
            insetOnOverlap: true,
            children: [
              SliverPositioned.fill(
                child: SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Container(
                    margin: EdgeInsets.only(top: 2, bottom: 72),
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
                ),
                sliver: SliverPadding(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        CatalogProductTypeCardWidget(
                            imageAsset: 'assets/images/debet_card_image.png',
                            productName: 'Дебетовые карты',
                            onTap: () {
                              ref.watch(goRouterProvider).push(
                                    RouteConstants.catalog,
                                    extra: BasicApiPageSettingsModel(
                                      productTypeUrl:
                                          ProductTypeEnum.debit_cards.name,
                                      pageName: 'Дебетовые карты',
                                      whereFrom:
                                          AppRoute.selectProductPage.name,
                                      filtersModel: FiltersModel(
                                        banks: [],
                                        paySystem: [],
                                        cashBack: [],
                                      ),
                                    ),
                                  );
                            }),
                        const SizedBox(
                          height: 6,
                        ),
                        CatalogProductTypeCardWidget(
                            imageAsset: 'assets/images/credit_card_image.png',
                            productName: 'Кредитные карты',
                            onTap: () {
                              ref.watch(goRouterProvider).push(
                                    RouteConstants.catalog,
                                    extra: BasicApiPageSettingsModel(
                                      productTypeUrl:
                                          ProductTypeEnum.credit_cards.name,
                                      pageName: 'Кредитные карты',
                                      whereFrom:
                                          AppRoute.selectProductPage.name,
                                      filtersModel: FiltersModel(
                                        banks: [],
                                        paySystem: [],
                                        cashBack: [],
                                      ),
                                    ),
                                  );
                            }),
                        const SizedBox(
                          height: 6,
                        ),
                        CatalogProductTypeCardWidget(
                            imageAsset: 'assets/images/micro_liases_image.png',
                            productName: 'Микрозаймы',
                            onTap: () {
                              ref.watch(goRouterProvider).push(
                                    RouteConstants.catalog,
                                    extra: BasicApiPageSettingsModel(
                                      productTypeUrl:
                                          ProductTypeEnum.zaimy.name,
                                      pageName: 'Микрозаймы',
                                      whereFrom:
                                          AppRoute.selectProductPage.name,
                                      filtersModel: FiltersModel(
                                        banks: [],
                                        paySystem: [],
                                        cashBack: [],
                                      ),
                                    ),
                                  );
                            }),
                        const SizedBox(
                          height: 6,
                        ),
                        CatalogProductTypeCardWidget(
                            imageAsset: 'assets/images/rko_image.png',
                            productName: 'РКО',
                            onTap: () {
                              ref.watch(goRouterProvider).push(
                                    RouteConstants.catalog,
                                    extra: BasicApiPageSettingsModel(
                                      productTypeUrl: ProductTypeEnum.rko.name,
                                      pageName: 'РКО',
                                      whereFrom:
                                          AppRoute.selectProductPage.name,
                                      filtersModel: FiltersModel(
                                        banks: [],
                                        paySystem: [],
                                        cashBack: [],
                                      ),
                                    ),
                                  );
                            }),
                        const SizedBox(
                          height: 6,
                        ),
                        CatalogProductTypeCardWidget(
                            imageAsset: 'assets/images/all_banks_image.png',
                            productName: 'Все банки',
                            onTap: () {
                              ref
                                  .watch(goRouterProvider)
                                  .push(RouteConstants.allBanks);
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
