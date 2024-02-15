import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/domain/promocodes_company_filters_model.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/widgets/promocodes_page_widgets/promocodes_list_widget.dart';

import 'widgets/select_category_page_widgets/select_company_list_widget.dart';
///промокодов временно не будет ( планируется добавить после релиза мвп)
class PromoCodesPage extends ConsumerStatefulWidget {
  const PromoCodesPage({super.key});

  @override
  ConsumerState<PromoCodesPage> createState() => _PromoCodesPageState();
}

class _PromoCodesPageState extends ConsumerState<PromoCodesPage> {
  late String category;
  late PromoCodesCompanyFiltersModel promoCodesFiltersModel;
  late List<String> selectedBankProducts;

  @override
  Widget build(BuildContext context) {
    selectedBankProducts = ref.watch(selectedCompanyFilterStateProvider);
    promoCodesFiltersModel = ref.watch(companyFiltersProvider);
    category = ref.watch(promoCodesCategoryStateProvider);
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
                  itemCount: promoCodesFiltersModel
                      .promoCodesAllCompaniesFilters
                      .where((element) => element.category == category)
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CompaniesFilterListWidget(
                      promoCodesAllFilters: promoCodesFiltersModel
                          .promoCodesAllCompaniesFilters
                          .where((element) => element.category == category)
                          .toList()[index],
                      onTap: () {
                        setState(() {});
                      },
                    );
                  }),
            ),
          ),
          const PromoCodesListWidget(),
        ],
      ),
    );
  }
}
