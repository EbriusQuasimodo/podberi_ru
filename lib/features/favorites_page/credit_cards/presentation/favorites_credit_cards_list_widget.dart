import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'favorite_credit_card_widget.dart';

class FavoritesCreditCardsList extends ConsumerStatefulWidget {
  int itemsCount;

  ///страница-список всех кредиток в избранном
  FavoritesCreditCardsList({
    super.key,
    required this.itemsCount,
  });

  @override
  ConsumerState<FavoritesCreditCardsList> createState() =>
      _FavoritesCreditCardsList();
}

class _FavoritesCreditCardsList
    extends ConsumerState<FavoritesCreditCardsList> {
  static const pageSize = 10;
  final controller = ScrollController();

  @override
  void didChangeDependencies() {
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent &&
          !loading) {
        _loadMore();
      }
    });
    _loadMore();
    super.didChangeDependencies();
  }

  bool loading = false;

  Future<void> _loadMore() async {
    if (favoritesCreditCardsList.length < widget.itemsCount) {
      try {
        loading = true;
        await ref.read(favoritesCreditCardsListControllerProvider(
                IsarPaginationParamsModel(
                    offset: favoritesCreditCardsList.length ~/ pageSize,
                    limit: pageSize))
            .future);
        if (mounted) {
          setState(() {
            favoritesCreditCardsList =
                ref.watch(favoritesCreditCardsListStateProvider);
          });
        }
      } finally {
        loading = false;
      }
    }
  }

  Future<void> _deleteFromFavorites(String id) async {
    try {
      loading = true;
      setState(() {
        ref
            .watch(favoritesCreditCardsListStateProvider.notifier)
            .state
            .removeWhere((element) => element.id == id);
        widget.itemsCount--;
      });
    } finally {
      loading = false;
    }
  }

  Future<void> _tapOnComparisonButton(int index) async {
    try {
      loading = true;
      await ref.read(favoritesCreditCardsListControllerProvider(
              IsarPaginationParamsModel(
                  offset: favoritesCreditCardsList.length ~/ pageSize,
                  limit: pageSize))
          .future);
      if (mounted) {
        setState(() {});
      }
    } finally {
      loading = false;
    }
  }

  List<ListCreditCardsModel> favoritesCreditCardsList = [];

  @override
  Widget build(BuildContext context) {
    favoritesCreditCardsList = ref.watch(favoritesCreditCardsListStateProvider);
    if (favoritesCreditCardsList.isNotEmpty) {
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
                  right: 15,
                  left: 15,
                ),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 272,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeTop: true,
                      child: ListView.builder(
                          key: const PageStorageKey<String>('favoritesCreditCardsList'),
                          padding: const EdgeInsets.only(top: 15),
                          itemCount: favoritesCreditCardsList.length >=
                              widget.itemsCount
                              ? widget.itemsCount
                              : favoritesCreditCardsList.length,
                          controller: controller,
                          itemBuilder: (context, index) {
                            return FavoriteCreditCardWidget(
                              tapOnComparisonButton: () {
                                _tapOnComparisonButton(index);
                              },
                              deleteFromFavorites: () {
                                _deleteFromFavorites(favoritesCreditCardsList[index].id);
                              },
                              productInfo: favoritesCreditCardsList[index],
                              basicApiPageSettingsModel:
                              BasicApiPageSettingsModel(
                                page: 1,
                                filters: FiltersModel(),
                                productTypeUrl:
                                ref.watch(favoritesProductUrlStateProvider),
                                pageName: 'Избранное',
                              ),
                              productRating: '4.8',
                            );
                          }),
                    ),
                  ),
                )),
          ),
        ],
      );
    } else if (loading) {
      return SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: Container(
          margin: const EdgeInsets.only(top: 2, bottom: 72),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ThemeApp.mainWhite,
          ),
        ),
      );
    } else {
      _loadMore();
      return const FavoritesOrComparisonIsEmpty(
        error: 'У вас пока нет продуктов в избранном по данной категории.',
      );
    }
  }
}
