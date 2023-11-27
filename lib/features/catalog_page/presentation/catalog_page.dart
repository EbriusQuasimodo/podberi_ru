import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/product_list/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'catalog_controller.dart';

class CatalogPage extends ConsumerStatefulWidget {
  //final String productType;
  final String whereFrom;

  const CatalogPage(
      {super.key, // required this.productType,
      required this.whereFrom});

  @override
  ConsumerState<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends ConsumerState<CatalogPage> {
  String sortType = 'По новизне';
  var sortVariantsList = ['По популярности', 'По рейтингу', 'По новизне'];
  late String productType;

  @override
  Widget build(BuildContext context) {
    productType = widget.whereFrom == AppRoute.selectProductPage.name
        ? ref.watch(productTypeFromCatalogStateProvider)
        : ref.watch(productTypeFromHomeStateProvider);
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
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      showModalBottomSheet(
                          barrierColor: Colors.white.withOpacity(0),
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: ThemeApp.mainWhite,
                                  borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: ListView.builder(
                                  itemCount: sortVariantsList.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: ThemeApp.grey,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          onTap: () {
                                            setState(() {
                                              sortType =
                                                  sortVariantsList[index];
                                            });
                                            ref.read(goRouterProvider).pop();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 15,
                                                bottom: 15),
                                            child: Text(
                                              sortVariantsList[index],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/sort_icon.svg'),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          sortType,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (BuildContext context){return FiltersPage();}));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Фильтры',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset('assets/icons/filter_icon.svg'),
                      ],
                    ),
                  ),
                ],
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Text(
                      'Найдено (132 шт.)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeApp.darkestGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(
                    top: 47, right: 15, left: 15, bottom: 5),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: 10,
                        (context, index) => ProductCardWidgetWithButtons(
                            productName: 'Тинькофф Black',
                            productShortDescription:
                                'На остаток - до 5%\nБесплатное обслуживание\nСнятие без % - 500 000 руб.\nДоставка 1-2 дня\nБез овердрафта',
                            productRating: '4.8',
                            bankLogoIconPath:
                                'assets/icons/tinkoff_logo_icon.svg'))),
              )),
        ],
      ),
    );
  }
}
