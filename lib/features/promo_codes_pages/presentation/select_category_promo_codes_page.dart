import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/domain/promocodes_company_filters_model.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_page.dart';

import 'widgets/select_category_page_widgets/category_list_widget.dart';
import 'widgets/select_category_page_widgets/select_company_list_widget.dart';
///промокодов временно не будет ( планируется добавить после релиза мвп)
///when press on company or category - go to [PromoCodesPage]
class SelectCategoryPromoCodesPage extends ConsumerStatefulWidget {
  const SelectCategoryPromoCodesPage({super.key});

  @override
  ConsumerState<SelectCategoryPromoCodesPage> createState() =>
      _SelectCategoryPromoCodesPageState();
}

class _SelectCategoryPromoCodesPageState
    extends ConsumerState<SelectCategoryPromoCodesPage> {
  late PromoCodesCompanyFiltersModel promoCodesCompaniesFiltersModel;
  late List<String> promoCodesCompanyNames;

  @override
  Widget build(BuildContext context) {
    promoCodesCompanyNames = ref.watch(selectedCompanyFilterStateProvider);
    promoCodesCompaniesFiltersModel = ref.watch(companyFiltersProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Бонусы'),
          ),

          ///filter list of companies
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              height: 90,
              decoration: BoxDecoration(
                  color: ThemeApp.mainWhite,
                  borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  itemCount: promoCodesCompaniesFiltersModel
                      .promoCodesAllCompaniesFilters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CompaniesFilterListWidget(
                      promoCodesAllFilters: promoCodesCompaniesFiltersModel
                          .promoCodesAllCompaniesFilters[index],
                      onTap: () {
                        ref
                                .watch(promoCodesCategoryStateProvider.notifier)
                                .state =
                            promoCodesCompaniesFiltersModel
                                .promoCodesAllCompaniesFilters[index].category;
                        // ref
                        //     .watch(goRouterProvider)
                        //     .push(RouteConstants.promocodes);
                      },
                    );
                  }),
            ),
          ),
          CategoryListWidget(),
        ],
      ),
    );
  }
}
