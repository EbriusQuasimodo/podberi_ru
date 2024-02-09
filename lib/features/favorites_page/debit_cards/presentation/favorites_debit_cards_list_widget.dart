import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
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
  int offset = 0;
  int page = 0;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent &&
          !loading) {
        _loadMore();
      }
    });
    _loadMore();
  }
 @override
  void didChangeDependencies() {
    if(ref.watch(itemsCountFavoritesStateProvider.notifier).state != 0){
      setState(() {
        widget.itemsCount = ref.watch(itemsCountFavoritesStateProvider);
      });
    }
    super.didChangeDependencies();
  }
  bool loading = false;
  Future<void> _loadMore() async {
    if (favoritesDebitCardsList.length < widget.itemsCount) {
      try {
        loading = true;
        final newPackages = await ref.read(
            favoritesDebitCardsListControllerProvider(IsarPaginationParamsModel(
                    offset: favoritesDebitCardsList.length ~/ pageSize,
                    limit: pageSize))
                .future);
        if (mounted) {
          print(newPackages.items.length);
          setState(() {
            favoritesDebitCardsList.addAll(newPackages.items);
          });
        }
      } finally {
        loading = false;
      }
    }
  }

  Future<void> _deleteFromFavorites(int index) async {
    try {
      loading = true;
      setState(() {
        favoritesDebitCardsList.removeAt(index);
        widget.itemsCount--;
      });
ref.watch(itemsCountFavoritesStateProvider.notifier).state = widget.itemsCount;
    } finally {
      loading = false;
    }
  }

  Future<void> _tapOnComparisonButton(int index) async {
    try {
      loading = true;
      final newPackages = await ref.read(
          favoritesDebitCardsListControllerProvider(IsarPaginationParamsModel(
                  offset: favoritesDebitCardsList.length ~/ pageSize,
                  limit: pageSize))
              .future);
      if (mounted) {
        setState(() {
          // favoritesDebitCardsList.addAll(newPackages.items);
        });
      }
    } finally {
      loading = false;
    }
  }

  List<ListDebitCardsModel> favoritesDebitCardsList = [];

  @override
  Widget build(BuildContext context) {
    print("favoritesDebitCardsList.length ${favoritesDebitCardsList.length}");
    print("widget.itemsCount ${widget.itemsCount}");
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
                    height: MediaQuery.of(context).size.height - 242,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeTop: true,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          itemCount: favoritesDebitCardsList.length,
                          controller: controller,
                          itemBuilder: (context, index) {
                            return FavoriteDebitCardWidget(
                              tapOnComparisonButton: () {
                                _tapOnComparisonButton(index);
                              },
                              deleteFromFavorites: () {
                                _deleteFromFavorites(index);
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
      return const FavoritesOrComparisonIsEmpty(
        error: 'У вас пока нет продуктов в избранном по данной категории.',
      );
    }
  }
}
