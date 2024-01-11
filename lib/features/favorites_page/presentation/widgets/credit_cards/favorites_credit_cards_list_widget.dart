import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_controller.dart';
import 'favorite_credit_card_widget.dart';

class FavoritesCreditCardsList extends ConsumerWidget {
  final int itemsCount;

  const FavoritesCreditCardsList({
    super.key,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
        padding:
            const EdgeInsets.only(top: 90, right: 15, left: 15, bottom: 15),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: itemsCount, (context, index) {
            return ref.watch(favoritesCreditCardsListControllerProvider).when(
                data: (favoritesCreditCards) {
                  return FavoriteCreditCardWidget(
                    onTap: () {
                      ref.refresh(favoritesCreditCardsListControllerProvider);
                    },
                    productInfo: favoritesCreditCards.items[index],
                    basicApiPageSettingsModel: BasicApiPageSettingsModel(
                      productTypeUrl: ref.watch(favoritesProductUrlStateProvider),
                      pageName: 'Избранное',
                    ),
                    productRating: '4.8',
                  );
                },
                error: (error, _) {
                  return SliverFillRemaining(
                    child: OnErrorWidget(
                        error: error.toString(),
                        onGoBackButtonTap: () {
                          ref.watch(goRouterProvider).pop();
                        },
                        onRefreshButtonTap: () {
                          ref.refresh(favoritesCreditCardsListControllerProvider);
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
        ));
  }
}
