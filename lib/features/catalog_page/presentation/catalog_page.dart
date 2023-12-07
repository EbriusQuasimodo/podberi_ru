import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_and_product_type_widget.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/pruducts_list_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'catalog_controller.dart';
import 'widgets/sort_and_filter_widget.dart';

class CatalogPage extends ConsumerStatefulWidget {
  final String whereFrom;

  const CatalogPage({super.key, required this.whereFrom});

  @override
  ConsumerState<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends ConsumerState<CatalogPage> {
  late String productType;

  @override
  Widget build(BuildContext context) {
    ///check product type title
    switch (widget.whereFrom) {
      case "selectProductPage":
        productType = ref.watch(productTypeTitleFromCatalogStateProvider);

        break;
      case "homePage":
        productType = ref.watch(productTypeTitleFromHomeStateProvider);

        break;
      case "allBanksPage":
        productType = 'Каталог';

        break;
    }

    return ref.watch(bankProductsControllerProvider(widget.whereFrom)).when(
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
                child: widget.whereFrom == AppRoute.allBanksPage.name
                    ? BankAndProductTypeWidget(
                        onTap: () {
                          setState(() {});
                        },
                      )
                    : const SortAndFilterWidget(),
              ),
            ),
            ProductListWidget(
              whereFrom: widget.whereFrom,
              productInfo: debitCard,
            ),
          ],
        ),
      );
    }, error: (error, _) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    });
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
          ProductListWidget(
            whereFrom: widget.whereFrom,
            productInfo: [],
          ),
        ],
      ),
    );
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
