import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/list_widgets/debit_cards/debit_card_button_widget.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/presentation/controllers/favorites_zaimy_controller.dart';

import 'favorite_zaimy_widget.dart';

class FavoritesZaimyList extends ConsumerWidget {
  final int itemsCount;

  const FavoritesZaimyList({
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
            return ref.watch(favoritesZaimyListControllerProvider).when(
                data: (favoritesZaimy) {
                  return FavoriteZaimyWidget(
                    onTap: () {
                      ref.refresh(favoritesZaimyListControllerProvider);
                    },
                    productInfo: favoritesZaimy.items[index],
                    basicApiPageSettingsModel: BasicApiPageSettingsModel(
                      productTypeUrl: ref.watch(filterProductUrlStateProvider),
                      pageName: 'Избранное',
                    ),
                    productRating: '4.8',
                  );
                },
                error: (error, _) {
                  return OnErrorWidget(
                      error: error.toString(),
                      onGoBackButtonTap: () {
                        ref.watch(goRouterProvider).pop();
                      },
                      onRefreshButtonTap: () {
                        ref.refresh(favoritesZaimyListControllerProvider);
                      });
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
