import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/presentation/custom_app_bar_with_search.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/product_type_card.dart';

import 'catalog_controller.dart';

class SelectProductPage extends ConsumerWidget {
  SelectProductPage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarWithSearch(
              topPadding: 30,
              bottomPadding: 15,
              controller: searchController,
              title: 'Каталог',
            ),
          ),
          SliverFillRemaining(
            child: Container(
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              padding: const EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  CatalogProductTypeCardWidget(
                      imageAsset: 'assets/images/debet_card_image.png',
                      productName: 'Дебетовые карты',
                      onTap: () {
                        ref
                            .watch(productTypeFromCatalogStateProvider.notifier)
                            .state = 'Дебетовые карты';
                        ref.watch(goRouterProvider).push('/catalog',
                            extra: AppRoute.selectProductPage.name);
                      }),
                  const SizedBox(
                    height: 6,
                  ),
                  CatalogProductTypeCardWidget(
                      imageAsset: 'assets/images/credit_card_image.png',
                      productName: 'Кредитные карты',
                      onTap: () {
                        ref
                            .watch(productTypeFromCatalogStateProvider.notifier)
                            .state = 'Кредитные карты';
                        ref.watch(goRouterProvider).push('/catalog',
                            extra: AppRoute.selectProductPage.name);
                      }),
                  const SizedBox(
                    height: 6,
                  ),
                  CatalogProductTypeCardWidget(
                      imageAsset: 'assets/images/micro_liases_image.png',
                      productName: 'Микрозаймы',
                      onTap: () {
                        ref
                            .watch(productTypeFromCatalogStateProvider.notifier)
                            .state = 'Микрозаймы';
                        ref.watch(goRouterProvider).push('/catalog',
                            extra: AppRoute.selectProductPage.name);
                      }),
                  const SizedBox(
                    height: 6,
                  ),
                  CatalogProductTypeCardWidget(
                      imageAsset: 'assets/images/rko_image.png',
                      productName: 'РКО',
                      onTap: () {
                        ref
                            .watch(productTypeFromCatalogStateProvider.notifier)
                            .state = 'РКО';
                        ref.watch(goRouterProvider).push('/catalog',
                            extra: AppRoute.selectProductPage.name);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
