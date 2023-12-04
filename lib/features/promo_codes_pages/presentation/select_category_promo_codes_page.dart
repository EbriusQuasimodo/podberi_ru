import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/widgets/select_company_list_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PromoCodesFiltersModel {
  final List<PromoCodesAllFilters> promoCodesAllFilters;

  PromoCodesFiltersModel({required this.promoCodesAllFilters});
}

class PromoCodesAllFilters {
  final String companyName;
  final String category;
  final String imagePath;
  final Color color;

  PromoCodesAllFilters({
    required this.category,
    required this.color,
    required this.companyName,
    required this.imagePath,
  });
}

class SelectCategoryPromoCodesPage extends ConsumerStatefulWidget {
  const SelectCategoryPromoCodesPage({super.key});

  @override
  ConsumerState<SelectCategoryPromoCodesPage> createState() =>
      _SelectCategoryPromoCodesPageState();
}

class _SelectCategoryPromoCodesPageState
    extends ConsumerState<SelectCategoryPromoCodesPage> {
  late PromoCodesFiltersModel promoCodesFiltersModel;
  late List<String> selectedBankProducts;

  final List<String> categoryPromoCodesNamesList = [
    'Онлайн-сервисы',
    'Еда и напитки',
    'Маркетплейсы',
    'Красота и здоровье',
    'Путешествия',
    'Дом и ремонт',
    'Спорт',
    'Мода',
    'Для питомцев',
  ];
  final List<String> categoryPromoCodesImagesList = [
    'assets/images/promo_codes_images/online_services_image.png',
    'assets/images/promo_codes_images/food_drinks_image.png',
    'assets/images/promo_codes_images/marketplaces_image.png',
    'assets/images/promo_codes_images/beauty_health_image.png',
    'assets/images/promo_codes_images/travel_image.png',
    'assets/images/promo_codes_images/house_repair_image.png',
    'assets/images/promo_codes_images/sport_image.png',
    'assets/images/promo_codes_images/fashion_image.png',
    'assets/images/promo_codes_images/pets_image.png',
  ];

  @override
  Widget build(BuildContext context) {
    selectedBankProducts = ref.watch(selectedCompanyFilterStateProvider);
    promoCodesFiltersModel = ref.watch(filtersStateProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Бонусы'),
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
                  itemCount: promoCodesFiltersModel.promoCodesAllFilters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SelectCompanyListWidget(
                      promoCodesAllFilters:
                          promoCodesFiltersModel.promoCodesAllFilters[index],
                      onTap: () {
                        ref
                                .watch(promoCodesCategoryStateProvider.notifier)
                                .state =
                            promoCodesFiltersModel
                                .promoCodesAllFilters[index].category;
                        ref
                            .watch(goRouterProvider)
                            .push(RouteConstants.promocodes);
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
                  ),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(
                        top: 12, right: 12, left: 12, bottom: 12),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                          margin: const EdgeInsets.only(
                              top: 3, bottom: 3, right: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeApp.grey,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 15,
                                  left: 15,
                                  right: 15,
                                  child: Text(
                                    categoryPromoCodesNamesList[index],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeApp.backgroundBlack),
                                  )),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                      categoryPromoCodesImagesList[index])),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      ref
                                          .watch(promoCodesCategoryStateProvider.notifier)
                                          .state = categoryPromoCodesNamesList[index];
                                      ref
                                          .watch(goRouterProvider)
                                          .push(RouteConstants.promocodes);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        childCount: categoryPromoCodesNamesList.length,
                      ),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
