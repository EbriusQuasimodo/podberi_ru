import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'favorite_debit_card_widget.dart';

class FavoritesDebitCardsList extends ConsumerWidget {
  final int itemsCount;

  const FavoritesDebitCardsList({
    super.key,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStack(
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

          ),
          sliver: SliverPadding(
              padding: const EdgeInsets.only(
                  top: 15, right: 15, left: 15, bottom: 15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(childCount: itemsCount,
                    (context, index) {
                  return ref
                      .watch(favoritesDebitCardsListControllerProvider)
                      .when(data: (favoritesDebitCards) {
                    return FavoriteDebitCardWidget(
                      onTap: () {
                        ref.refresh(favoritesDebitCardsListControllerProvider);
                      },
                      productInfo: favoritesDebitCards.items[index],
                      basicApiPageSettingsModel: BasicApiPageSettingsModel(
                        productTypeUrl:
                            ref.watch(favoritesProductUrlStateProvider),
                        pageName: 'Избранное',
                      ),
                      productRating: '4.8',
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
                                favoritesDebitCardsListControllerProvider);
                          }),
                    );
                  }, loading: () {
                    return const SliverFillRemaining(
                      child: CustomLoadingCardWidget(
                        bottomPadding: 72,
                      ),
                    );
                  });
                }),
              )),
        ),
      ],
    );
  }
}
