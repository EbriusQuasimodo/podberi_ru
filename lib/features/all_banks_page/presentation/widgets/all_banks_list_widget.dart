import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/pagination_params_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AllBanksListWidget extends ConsumerWidget {
  final int itemCount;

  ///виджет со списком банков, используется на странице [AllBanksPage]
  AllBanksListWidget({
    super.key,
    required this.itemCount,
  });

  static const pageSize = 20;
  int page = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStack(
      insetOnOverlap: true,
      children: [
        SliverPositioned.fill(
          child: SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Container(
              margin:  EdgeInsets.only(top: 2, bottom: MediaQuery.of(context).padding.bottom),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
          ),
        ),
        SliverContainer(
          margin: EdgeInsets.only(top: 2, bottom: MediaQuery.of(context).padding.bottom),
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
          ),
          sliver: SliverPadding(
            padding:
                const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 9),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(childCount: itemCount,
                  (context, index) {
                page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;
                return ref.watch(allBanksControllerProvider(PaginationParamsModel(fetch: pageSize, page: page))).when(
                  data: (allBanks) {
    if (indexInPage >= allBanks.items.length) {
    return const SizedBox.shrink();
    } else {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          ref
                              .watch(productTypeUrlFromAllBanksStateProvider
                                  .notifier)
                              .state = 'debit_cards';
                          ref.watch(goRouterProvider).push(
                              RouteConstants.catalog,
                              extra: BasicApiPageSettingsModel(
                                  page: 1,
                                  bankDetailsModel: BankListDetailsModel(
                                      logo: allBanks.items[indexInPage].logo,
                                      bankName:
                                          allBanks.items[indexInPage].bankName),
                                  filters: FiltersModel(banks: [
                                    allBanks.items[indexInPage].bankName
                                  ]),
                                  whereFrom: AppRoute.allBanksPage.name,
                                  productTypeUrl:
                                      ProductTypeEnum.debit_cards.name,
                                  pageName: 'Каталог'));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 15, right: 20),
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(int.parse(
                                '0xff${allBanks.items[indexInPage].color}')),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.only(
                                    top: 9, right: 7, left: 7, bottom: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ThemeApp.mainWhite,
                                ),
                                child: Image.network(
                                  '${Urls.api.files}/${allBanks.items[indexInPage].icon}',
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return SvgPicture.asset(
                                      'assets/icons/photo_not_found.svg',
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                allBanks.items[indexInPage].bankName,
                                style: const TextStyle(
                                    color: ThemeApp.mainWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              // const Spacer(),
                              // const Icon(
                              //   Icons.star,
                              //   color: ThemeApp.mainWhite,
                              //   size: 20,
                              // ),
                              // const Text(
                              //   '4.8',
                              //   style: TextStyle(
                              //       color: ThemeApp.mainWhite,
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 20),
                              // )
                            ],
                          ),
                        ),
                      ),
                    );}
                  },
                  error: (error, _) {
                    return SizedBox.shrink();
                  },
                  loading: () {
                    return SizedBox.shrink();
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
