import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/widgets/promocode_card_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'select_category_promo_codes_page.dart';
import 'widgets/select_company_list_widget.dart';

class PromoCodesPage extends ConsumerStatefulWidget {
  PromoCodesPage({super.key});

  @override
  ConsumerState<PromoCodesPage> createState() => _PromoCodesPageState();
}

class _PromoCodesPageState extends ConsumerState<PromoCodesPage> {
  late String category;
  late PromoCodesFiltersModel promoCodesFiltersModel;
  late List<String> selectedBankProducts;

  @override
  Widget build(BuildContext context) {
    selectedBankProducts = ref.watch(selectedCompanyFilterStateProvider);
    promoCodesFiltersModel = ref.watch(filtersStateProvider);
    category = ref.watch(promoCodesCategoryStateProvider);
    //print(selectedBankProducts.length);
    print(selectedBankProducts);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text(category),
            leading: IconButton(
              onPressed: () {
                ref
                    .watch(selectedCompanyFilterStateProvider.notifier)
                    .state
                    .clear();
                ref.read(goRouterProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              height: 90,
              decoration: BoxDecoration(
                  color: ThemeApp.mainWhite,
                  borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  itemCount: promoCodesFiltersModel.promoCodesAllFilters
                      .where((element) => element.category == category)
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SelectCompanyListWidget(
                      promoCodesAllFilters: promoCodesFiltersModel
                          .promoCodesAllFilters
                          .where((element) => element.category == category)
                          .toList()[index],
                      onTap: () {
                        setState(() {});
                        print(selectedBankProducts);
                      },
                    );
                  }),
            ),
          ),
          SliverStack(
            insetOnOverlap: true,
            children: [
              SliverPositioned.fill(
                child: SliverFillRemaining(
                  fillOverscroll: true,
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 72,
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
                ),
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(
                      top: 15, right: 15, left: 15, bottom: 15),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount:10,
                            (context, index) {

                          return PromoCodesCardWidget(productName: 'МногоЛосося',
                              productShortDescription: 'Много Лосося — ролл Снежная Калифорния в подарок при заказе от 1800 руб.!',
                              companyLogoIconPath:'assets/icons/promo_codes_icons/mnogo_lososya_logo.svg',
                              color: Color(0xffFF5700));

                        }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
