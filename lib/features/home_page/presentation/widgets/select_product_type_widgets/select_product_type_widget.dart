import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'home_product_type_card.dart';

class SelectProductTypeWidget extends ConsumerWidget {
  const SelectProductTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding:
            const EdgeInsets.only(right: 15, left: 15, bottom: 30, top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 22,
              ),
              child: Text(
                'Выберите тип продукта',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            HomeProductTypeCardWidget(
                imageAsset: 'assets/icons/debet_card_icon.svg',
                productName: 'Дебетовые карты',
                onTap: () {
                  ref.watch(productTypeFromHomeStateProvider.notifier).state =
                      'Дебетовые карты';
                  ref.watch(goRouterProvider).push('/catalog', extra: AppRoute.homePage.name);
                }),
            const SizedBox(
              height: 6,
            ),
            HomeProductTypeCardWidget(
                imageAsset: 'assets/icons/credit_card_icon.svg',
                productName: 'Кредитные карты',
                onTap: () {
                  ref.watch(productTypeFromHomeStateProvider.notifier).state =
                      'Кредитные карты';
                  ref.watch(goRouterProvider).push('/catalog', extra: AppRoute.homePage.name);
                }),
            const SizedBox(
              height: 6,
            ),
            HomeProductTypeCardWidget(
                imageAsset: 'assets/icons/micro_liases_icon.svg',
                productName: 'Микрозаймы',
                onTap: () {
                  ref.watch(productTypeFromHomeStateProvider.notifier).state =
                      'Микрозаймы';
                  ref.watch(goRouterProvider).push('/catalog', extra: AppRoute.homePage.name);
                }),
            const SizedBox(
              height: 6,
            ),
            HomeProductTypeCardWidget(
                imageAsset: 'assets/icons/for_business_icon.svg',
                productName: 'РКО',
                onTap: () {
                  ref.watch(productTypeFromHomeStateProvider.notifier).state = 'РКО';
                  ref.watch(goRouterProvider).push('/catalog', extra: AppRoute.homePage.name);
                }),
          ],
        ),
      ),
    );
  }
}
