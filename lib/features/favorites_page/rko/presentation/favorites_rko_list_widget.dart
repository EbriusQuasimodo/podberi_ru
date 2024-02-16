import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/presentation/favorites_or_comparison_is_empty.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/rko/presentation/rko_controller.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'favorite_rko_widget.dart';
import 'favorites_rko_controller.dart';

class FavoritesRkoList extends ConsumerStatefulWidget {
  int itemsCount;
  final Size? choiceChipSize;

  ///список - страница всех рко в избранном
  FavoritesRkoList({
    super.key,
    required this.itemsCount,
    required this.choiceChipSize,
  });

  @override
  ConsumerState<FavoritesRkoList> createState() => _FavoritesRkoListState();
}

class _FavoritesRkoListState extends ConsumerState<FavoritesRkoList> {
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
    if (favoritesRkoList.length < widget.itemsCount) {
      try {
        loading = true;
        await ref.read(favoritesRkoListControllerProvider(
                IsarPaginationParamsModel(
                    offset: favoritesRkoList.length ~/ pageSize,
                    limit: pageSize))
            .future);
        if (mounted) {
          setState(() {
            favoritesRkoList = ref.watch(favoritesRkoListStateProvider);
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
      ref.invalidate(rkoDetailsControllerProvider);
      // ref.invalidate(debitCardsControllerProvider);
      setState(() {
        ref
            .watch(favoritesRkoListStateProvider.notifier)
            .state
            .removeWhere((element) => element.id == id);
        widget.itemsCount--;
      });
    } finally {
      loading = false;
    }
  }

  List<ListRkoModel> favoritesRkoList = [];

  @override
  Widget build(BuildContext context) {
    favoritesRkoList = ref.watch(favoritesRkoListStateProvider);
    if (favoritesRkoList.isNotEmpty) {
      return SliverStack(
        insetOnOverlap: true,
        children: [
          SliverPositioned.fill(
            child: SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Container(
                margin: EdgeInsets.only(
                    top: 2, bottom: MediaQuery.of(context).padding.bottom),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeApp.mainWhite,
                ),
              ),
            ),
          ),
          SliverContainer(
            margin: EdgeInsets.only(
              top: 2,
              bottom: MediaQuery.of(context).padding.bottom,
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
                    height: MediaQuery.of(context).size.height -
                        (kToolbarHeight +
                            widget.choiceChipSize!.height +
                            MediaQuery.of(context).padding.bottom +
                            7 +
                            MediaQuery.of(context).padding.top),
                    child: ListView.builder(
                        key: const PageStorageKey<String>('favoritesRkoList'),
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        itemCount: favoritesRkoList.length >= widget.itemsCount
                            ? widget.itemsCount
                            : favoritesRkoList.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return FavoriteRkoWidget(
                            deleteFromFavorites: () {
                              _deleteFromFavorites(favoritesRkoList[index].id);
                            },
                            productInfo: favoritesRkoList[index],
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
                )),
          ),
        ],
      );
    } else if (loading) {
      return SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: Container(
          margin: EdgeInsets.only(
              top: 2, bottom: MediaQuery.of(context).padding.bottom),
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
