import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/comparison_data_table_widgets/comparison_data_table_widget.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/product_comparison_widgets/product_comparison_widget.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ComparisonPage extends ConsumerStatefulWidget {
  ///страница сравнения банковских продуктов
  const ComparisonPage({super.key});

  @override
  ConsumerState<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends ConsumerState<ComparisonPage> {
  final List<String> bankProductsNamesListFilter = [
    'Дебетовые карты',
    'Кредитные карты',
    'Микрозаймы',
    'РКО'
  ];

  List<String> selectedBankProductsFilter = ['Дебетовые карты'];

  String firstProductDescription = '';
  String secondProductDescription = '';

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesListFilter) {
      list.add(CustomChoiceChip(
        whereFrom: 'comparison',
        onTap: () {
          setState(() {});
        },
        element: element,
        selectedBankProducts: selectedBankProductsFilter,
        bankProductsNamesList: bankProductsNamesListFilter,
      ));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(comparisonListControllerProvider).when(
      data: (comparisonData) {
        return Scaffold(
          body: RefreshIndicator(
            color: ThemeApp.mainBlue,
            onRefresh: ()=> ref.refresh(comparisonListControllerProvider.future),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: ThemeApp.mainWhite,
                  pinned: true,
                  title: Text('Сравнение'),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeApp.mainWhite,
                    ),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: list(),
                          )),
                    ),
                  ),
                ),
                comparisonData.items.isNotEmpty
                    ? ProductComparisonWidget(
                        onScrollPageViews: () {
                          setState(() {});
                        },
                        onDeleteInFirstList: () {
                          setState(() {});
                        },
                        comparisonList: comparisonData.items,
                        onDeleteInSecondList: () {
                          setState(() {});
                        })
                    : SliverFillRemaining(
                        child: Container(
                          margin: const EdgeInsets.only(top: 2, bottom: 72),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ThemeApp.mainWhite,
                          ),
                          child: Column(
                            children: [
                              const Spacer(),
                              const Padding(
                                padding:
                                    const EdgeInsets.only(right: 57, left: 57),
                                child: Text(
                                  'У вас пока нет продуктов в сравнении по данной категории',
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 17,
                                ),
                                child: MaterialButton(
                                  minWidth:
                                      MediaQuery.of(context).size.width - 30,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  padding: const EdgeInsets.only(
                                      top: 17, bottom: 16, left: 75, right: 75),
                                  onPressed: () {},
                                  color: ThemeApp.mainBlue,
                                  child: const Text(
                                    'В каталог',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeApp.mainWhite,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                comparisonData.items.isNotEmpty
                    ? ComparisonDataTableWidget()
                    : const SliverToBoxAdapter(child: SizedBox.shrink()),
              ],
            ),
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
