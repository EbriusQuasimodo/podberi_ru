import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/domain/promocodes_category_filters_model.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CategoryListWidget extends ConsumerWidget {
  CategoryListWidget({super.key});

  late PromoCodesCategoryFiltersModel categoryPromoCodesFiltersModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    categoryPromoCodesFiltersModel =
        ref.watch(categoryPromoCodesFiltersProvider);
    return SliverStack(
      insetOnOverlap: true,
      children: [
        SliverPositioned.fill(
          child: SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              height: MediaQuery.of(context).size.height - 72,
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
          ),
        ),
        SliverContainer(
          margin: const EdgeInsets.only(bottom: 72, top: 2),
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
          ),
          sliver: SliverPadding(
            padding:
                const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 12),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: const EdgeInsets.only(
                      top: 3, bottom: 3, right: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeApp.grey,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 15,
                          left: 15,
                          right: 15,
                          child: Text(
                            categoryPromoCodesFiltersModel
                                .promoCodesAllCategories[index].category,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ThemeApp.backgroundBlack),
                          )),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            categoryPromoCodesFiltersModel
                                .promoCodesAllCategories[index].imagePath,
                          )),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              ref
                                      .watch(promoCodesCategoryStateProvider
                                          .notifier)
                                      .state =
                                  categoryPromoCodesFiltersModel
                                      .promoCodesAllCategories[index].category;
                              ref
                                  .watch(goRouterProvider)
                                  .push(RouteConstants.promocodes);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: categoryPromoCodesFiltersModel
                    .promoCodesAllCategories.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
