import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'favorites_page_controller.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  ///страница избранного
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО',
    'Микрозаймы'
  ];

  List<String> selectedBankProducts = [];

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesList) {
      list.add(CustomChoiceChip(
          onTap: () {
            setState(() {});
          },
          element: element,
          selectedBankProducts: selectedBankProducts,
          bankProductsNamesList: bankProductsNamesList,
          whereFrom: 'favorites'));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  void didChangeDependencies() {
    selectedBankProducts.add('Дебетовые карты');
    super.didChangeDependencies();
  }

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return ref.watch(favoritesListControllerProvider).when(
      data: (favoritesData) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                scrolledUnderElevation: 0,
                backgroundColor: ThemeApp.mainWhite,
                pinned: true,
                title: Text('Избранное'),
              ),
          SliverStack(
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
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: list(),
                        ),
                      ),
                    ),
                  ),
                  sliver: favoritesData != []
                      ? SliverPadding(
                      padding: const EdgeInsets.only(
                          top: 90, right: 15, left: 15, bottom: 15),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: favoritesData.items.length,
                              (context, index) =>
                              ProductCardWidgetWithButtons(
                                onTap: () {
                                  ref.refresh(
                                      favoritesListControllerProvider);
                                },
                                productInfo: favoritesData.items[index],
                                isFavorite: false,
                                basicApiPageSettingsModel:
                                BasicApiPageSettingsModel(
                                  productTypeUrl:
                                  ref.watch(filterProductUrlStateProvider),
                                  pageName: 'Избранное',
                                ),
                                productRating: '4.8',
                              ),
                        ),
                      ))
                      : SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 57, left: 57),
                          child: Text(
                              'У вас пока нет избранных продуктов'),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 17,
                          ),
                          child: MaterialButton(
                            minWidth:
                            MediaQuery.of(context).size.width -
                                30,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(14)),
                            padding: const EdgeInsets.only(
                                top: 17,
                                bottom: 16,
                                left: 75,
                                right: 75),
                            onPressed: () {},
                            color: ThemeApp.mainBlue,
                            child: Text(
                              'В каталог',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ThemeApp.mainWhite,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
              //BankProductsListAndFilterWidget(favoritesData: favoritesData ),
            ],
          ),
        );
      },
      error: (error, _) {
        if (error.toString() == NothingFoundException().message) {
          return Scaffold(
            body: CustomScrollView(slivers: [
              SliverStack(
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
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 30),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: list(),
                          ),
                        ),
                      ),
                    ),
                    sliver: SliverPadding(
                        padding: const EdgeInsets.only(
                            top: 90, right: 15, left: 15, bottom: 15),
                        sliver: SliverToBoxAdapter(
                          child: Text(error.toString()),
                        )),
                  ),
                ],
              )
            ]),
          );
        } else if (error.toString() ==
            NoInternetConnectionException().message) {
          return Scaffold(
            body: CustomScrollView(slivers: [
              SliverFillRemaining(
                child: CustomErrorPageWidget(
                  buttonName: 'Перезагрузить',
                  onTap: () {
                    ref.refresh(favoritesListControllerProvider);
                  },
                  error: error.toString(),
                  bottomPadding: 72,
                ),
              )
            ]),
          );
        }
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: CustomErrorPageWidget(
                buttonName: 'Вернуться',
                onTap: () {
                  ref.watch(goRouterProvider).pop();
                },
                error: error.toString(),
                bottomPadding: 72,
              ),
            )
          ]),
        );
      },
      loading: () {
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: CustomLoadingCardWidget(
                bottomPadding: 72,
              ),
            ),
          ]),
        );
      },
    );
  }
}
