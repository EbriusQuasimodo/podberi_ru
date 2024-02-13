import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'favorite_debit_card_widget.dart';
import 'favorites_debit_cards_controller.dart';

class FavoritesDebitCardsList extends ConsumerStatefulWidget {
  int itemsCount;

  ///список - страница всех дебетовок в избранном
  FavoritesDebitCardsList({
    super.key,
    required this.itemsCount,
  });

  @override
  ConsumerState<FavoritesDebitCardsList> createState() =>
      _FavoritesDebitCardsListState();
}

class _FavoritesDebitCardsListState
    extends ConsumerState<FavoritesDebitCardsList> {
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
    if (favoritesDebitCardsList.length < widget.itemsCount) {
      try {
        loading = true;
        await ref.read(favoritesDebitCardsListControllerProvider(
                IsarPaginationParamsModel(
                    offset: favoritesDebitCardsList.length ~/ pageSize,
                    limit: pageSize))
            .future);
        if (mounted) {
          setState(() {
            favoritesDebitCardsList =
                ref.watch(favoritesDebitCardsListStateProvider);
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
     // ref.invalidate(debitCardsControllerProvider);
      setState(() {
        ref
            .watch(favoritesDebitCardsListStateProvider.notifier)
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
      await ref.read(favoritesDebitCardsListControllerProvider(
              IsarPaginationParamsModel(
                  offset: favoritesDebitCardsList.length ~/ pageSize,
                  limit: pageSize))
          .future);
      if (mounted) {
        setState(() {});
      }
    } finally {
      loading = false;
    }
  }

  List<ListDebitCardsModel> favoritesDebitCardsList = [];

  @override
  Widget build(BuildContext context) {
    favoritesDebitCardsList =
        ref.watch(favoritesDebitCardsListStateProvider);
    if (favoritesDebitCardsList.isNotEmpty) {
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
            margin: const EdgeInsets.only(
              top: 2,
            ),
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
                          key: const PageStorageKey<String>('favoritesDebitCardsList'),
                          padding: const EdgeInsets.only(top: 15),
                          itemCount: favoritesDebitCardsList.length >=
                                  widget.itemsCount
                              ? widget.itemsCount
                              : favoritesDebitCardsList.length,
                          controller: controller,
                          itemBuilder: (context, index) {
                            return FavoriteDebitCardWidget(
                              tapOnComparisonButton: () {
                                _tapOnComparisonButton(index);
                              },
                              deleteFromFavorites: () {
                                _deleteFromFavorites(favoritesDebitCardsList[index].id);
                              },
                              productInfo: favoritesDebitCardsList[index],
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
