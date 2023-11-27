import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/product_card_widget_without_buttons.dart';
import 'package:podberi_ru/core/presentation/custom_app_bar_with_search.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/promocodes_ads_item_widgets/promocodes_ads_item_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/standard_item_with_list_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/stories_item_widget.dart';

import 'widgets/best_offer_item_widgets/best_offer_item.dart';
import 'widgets/select_product_type_item_widgets/select_product_type_item_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarWithSearch(
              controller: searchController,
              topPadding: 30,
              bottomPadding: 17,
              title: 'Доброго дня, дорогой гость!',
            ),
          ),
          const StoriesItemWidget(),
          const BestOfferItem(),
          const SelectProductTypeItemWidget(),
          SliverToBoxAdapter(
            child: StandardItemWithListWidget(
              listHeight: 190,
              widgetName: 'Кредитные карты',
              showMoreButtonName: 'Показать все',
              onTapShowMoreButton: () {},
              childOfList: const BankProductCardWidgetWithoutButtons(
                  productName: 'Тинькофф \nДрайв Кредитная',
                  productShortDescription:
                      'Лимит - 1 000 000 руб.\nБез процентов - до 55 дней\nСтоимость - 495 руб./год\nКэшбек - от 1 до 30%',
                  productRating: '4.8',
                  bankLogoIconPath: 'assets/icons/tinkoff_logo_icon.svg'),
            ),
          ),
          SliverToBoxAdapter(
            child: StandardItemWithListWidget(
              listHeight: 140,
              widgetName: 'Выберите банк',
              showMoreButtonName: 'Все банки',
              onTapShowMoreButton: () {
                ref
                    .watch(productTypeFromHomeStateProvider.notifier)
                    .state = 'РКО';
                ref.watch(goRouterProvider).push(RouteConstants.allBanks);
              },
              childOfList: Material(
               color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFBE0B),
                    ),
                    width: 140,
                    height: 140,
                    margin: const EdgeInsets.only(right: 3, left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/tinkoff_logo_icon.svg', height: 51,width: 57,),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Тинькофф Банк',
                          maxLines: 3,
                          style: TextStyle(
                              color: ThemeApp.mainWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: StandardItemWithListWidget(
              listHeight: 190,
              widgetName: 'Дебетовые карты',
              showMoreButtonName: 'Показать все',
              onTapShowMoreButton: () {},
              childOfList: const BankProductCardWidgetWithoutButtons(
                  productName: 'Тинькофф',
                  productShortDescription:
                      'Бесплатная\nСнятие без % - 350 000 руб.\nДоставка 1-2 дня\nБез овердрафта',
                  productRating: '4.2',
                  bankLogoIconPath: 'assets/icons/tinkoff_logo_icon.svg'),
            ),
          ),
          const PromocodesAdsItem(),
          SliverToBoxAdapter(
            child: StandardItemWithListWidget(
                bottomPadding: 72,
                widgetName: 'Блог',
                showMoreButtonName: "Читать блог",
                onTapShowMoreButton: () {},
                childOfList: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 230,
                  margin: const EdgeInsets.only(right: 3, left: 3),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset('assets/images/blog_photo.png')),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ThemeApp.mainBlue,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Центральный банк поднимает ставку, чтобы душить экономику',
                                maxLines: 3,
                                style: TextStyle(
                                    color: ThemeApp.mainWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                listHeight: 230),
          )
        ],
      ),
    );
  }
}
