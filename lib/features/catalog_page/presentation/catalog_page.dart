import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_and_product_type_widget.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/products_list_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'catalog_controller.dart';
import 'widgets/sort_and_filter_widget.dart';

class CatalogPage extends ConsumerStatefulWidget {
  final FiltersModel filtersModel;

  const CatalogPage({super.key, required this.filtersModel});

  @override
  ConsumerState<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends ConsumerState<CatalogPage> {
  late String productType;
  late String bankName;
  late String bankPicture;
  List<String> filters = [];

  @override
  Widget build(BuildContext context) {
    print(widget.filtersModel.productType);
    ///check product type title
    switch (widget.filtersModel.productType) {
      case "selectProductPage":
        productType = ref.watch(productTypeTitleFromCatalogStateProvider);

        break;
      case "homePage":
        productType = ref.watch(productTypeTitleFromHomeStateProvider);

      case "allBanksPage":
        productType = 'Каталог';
        bankName = ref.watch(bankNameFromAllBanksStateProvider);
        bankPicture = ref.watch(bankPictureFromAllBanksStateProvider);
        break;
      case 'homePageBanks':
        productType = 'Каталог';
        bankName = ref.watch(bankNameFromHomeStateProvider);
        bankPicture = ref.watch(bankPictureFromHomeStateProvider);
        break;
      case "Дебетовые карты":
        productType = 'Дебетовые карты';

        break;
      case "Кредитные карты":
        productType = 'Кредитные карты';

        break;
    }
    final bankProductsData = ref.watch(bankProductsControllerProvider(widget.filtersModel));
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
                title: Text(productType),
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
                  child: widget.filtersModel.productType == AppRoute.allBanksPage.name ||
                          widget.filtersModel.productType == 'homePageBanks'
                      ? BankAndProductTypeWidget(
                    productType: widget.filtersModel.productType,
                          bankName: bankName,
                          bankPicture: bankPicture,
                          onTap: () {
                            setState(() {});
                          },
                        )
                      : SortAndFilterWidget(
                          onFiltersButtonTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return FiltersPage(whereFrom: widget.filtersModel.productType,);
                            }));
                          },
                        ),
                ),
              ),
              ProductListWidget(
                whereFrom: widget.filtersModel.productType,
                productInfo: debitCard,
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: CustomErrorPageWidget(
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
