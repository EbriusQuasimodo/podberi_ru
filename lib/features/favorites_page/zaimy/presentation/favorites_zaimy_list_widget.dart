import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'favorite_zaimy_widget.dart';
import 'favorites_zaimy_controller.dart';

class FavoritesZaimyList extends ConsumerWidget {
  final int itemsCount;

  ///страница-список всех займов в избранном
  const FavoritesZaimyList({
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
                    return ref.watch(favoritesZaimyListControllerProvider).when(
                        data: (favoritesZaimy) {
                      return FavoriteZaimyWidget(
                        onTap: () {
                          ref.refresh(favoritesZaimyListControllerProvider);
                        },
                        productInfo: favoritesZaimy.items[index],
                        basicApiPageSettingsModel: BasicApiPageSettingsModel(
                          page: 1,
                          filters: FiltersModel(),
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
                              ref.refresh(favoritesZaimyListControllerProvider);
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
                ))),
      ],
    );
  }
}
