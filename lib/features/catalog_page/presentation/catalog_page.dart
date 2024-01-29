import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_and_product_type_widget.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/load_product_list_by_product_type.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/load_sort_by_product_type.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/filters_page.dart';

import 'controllers/page_controllers/debit_cards_controller.dart';
import 'controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'widgets/sort_and_filter_widget.dart';

class CatalogPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница каталога, здесь отображаются все банковские продукты
  const CatalogPage({super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends ConsumerState<CatalogPage> {
  List<String> filters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () async {
          return ref.refresh(
              debitCardsControllerProvider(widget.basicApiPageSettingsModel));
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text(widget.basicApiPageSettingsModel.pageName!),
              leading: IconButton(
                onPressed: () {
                  if (widget.basicApiPageSettingsModel.whereFrom ==
                      AppRoute.homePage.name) {
                    ref
                        .watch(sortFromHomePageStateProvider
                        .notifier)
                        .state ='По умолчанию';
                  } else if (widget
                      .basicApiPageSettingsModel.whereFrom ==
                      AppRoute.selectProductPage.name) {
                    ref
                        .watch(
                        sortFromSelectProductPageStateProvider
                            .notifier)
                        .state = 'По умолчанию';
                  }
                  ref.read(goRouterProvider).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeApp.mainWhite,
                ),

                ///if came from all banks then show bank and product type widget else show sort and filter widget
                child: widget.basicApiPageSettingsModel.whereFrom ==
                            AppRoute.allBanksPage.name ||
                        widget.basicApiPageSettingsModel.whereFrom ==
                            'homePageBanks'
                    ? BankAndProductTypeWidget(
                        basicApiPageSettingsModel:
                            widget.basicApiPageSettingsModel,
                        onTap: () {
                          setState(() {});
                        },
                      )
                    : SortAndFilterWidget(
                  basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
                        onSortButtonTap: () {
                          showModalBottomSheet(
                              useRootNavigator:true,
                              constraints: const BoxConstraints(minWidth: double.infinity,maxHeight: 360),
                              context: context,
                              builder: (context) {
                                return LoadSortByProductType(basicApiPageSettingsModel: widget.basicApiPageSettingsModel);
                              });

                        },
                        onFiltersButtonTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return FiltersPage(
                              basicApiPageSettingsModel:
                                  widget.basicApiPageSettingsModel,
                            );
                          }));
                        },
                      ),
              ),
            ),
            LoadProductListByProductType(
                basicApiPageSettingsModel: widget.basicApiPageSettingsModel),
          ],
        ),
      ),
    );
  }
}
