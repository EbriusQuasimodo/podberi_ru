import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_and_product_type_widget.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/products_list_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page.dart';

import 'catalog_controller.dart';
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
    final bankProductsData = ref.watch(
        bankProductsControllerProvider(widget.basicApiPageSettingsModel));
    return bankProductsData.when(
      data: (debitCard) {
        return Scaffold(
          body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                scrolledUnderElevation: 0,
                backgroundColor: ThemeApp.mainWhite,
                pinned: true,
                title: Text(widget.basicApiPageSettingsModel.pageName!),
                leading: IconButton(
                  onPressed: () {
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
              ProductListWidget(
                basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
                productInfo: debitCard,
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        if (error.toString() == NothingFoundException().message) {
          return Scaffold(
            body: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: ThemeApp.mainWhite,
                  pinned: true,
                  title: Text(widget.basicApiPageSettingsModel.pageName!),
                  leading: IconButton(
                    onPressed: () {
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
                SliverFillRemaining(
                  child: Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 72),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeApp.mainWhite,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 57, left: 57),
                        child: Text(error.toString()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (error.toString() ==
            NoInternetConnectionException().message) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: CustomErrorPageWidget(
                    buttonName: 'Перезагрузить',
                    onTap: () {
                      ref.refresh(bankProductsControllerProvider(
                          widget.basicApiPageSettingsModel));
                    },
                    error: error.toString(),
                    bottomPadding: 72,
                  ),
                )
              ],
            ),
          );
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: [
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
            ],
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: CustomLoadingCardWidget(
                  bottomPadding: 72,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
