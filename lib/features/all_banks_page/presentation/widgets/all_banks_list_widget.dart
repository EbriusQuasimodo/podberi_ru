import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';

class AllBanksListWidget extends ConsumerWidget {
  final List<BankListDetailsModel> allBanks;

  ///виджет со списком банков, используется на странице [AllBanksPage]
  const AllBanksListWidget({
    super.key,
    required this.allBanks,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///todo: maybe change to sliver stack + sliver container
    return SliverContainer(
      margin: const EdgeInsets.only(top: 2, bottom: 72),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
      ),
      sliver: SliverPadding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 9),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: allBanks.length,
            (context, index) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ref
                      .watch(productTypeUrlFromAllBanksStateProvider.notifier)
                      .state = 'debit_cards';
                  ref.watch(goRouterProvider).push(RouteConstants.catalog,
                      extra: BasicApiPageSettingsModel(
                          bankDetailsModel: BankListDetailsModel(
                              logo: allBanks[index].logo,
                              bankName: allBanks[index].bankName),
                          filtersModel: FiltersModel(
                              banks: [allBanks[index].bankName],
                              paySystem: [],
                              cashBack: []),
                          whereFrom: AppRoute.allBanksPage.name,
                          productTypeUrl: ProductTypeEnum.debit_cards.name,
                          pageName: 'Каталог'));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, bottom: 15, right: 20),
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFBE0B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 9, right: 7, left: 7, bottom: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ThemeApp.mainWhite,
                        ),
                        child: Image.network(
                          '${Urls.api.files}/${allBanks[index].logo}',
                          height: 32,
                          width: 36,
                          errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(
                            Icons.error,
                            size: 51,
                            color: ThemeApp.backgroundBlack,
                          );
                        },

                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        allBanks[index].bankName,
                        style: TextStyle(
                            color: ThemeApp.mainWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: ThemeApp.mainWhite,
                        size: 20,
                      ),
                      const Text(
                        '4.8',
                        style: TextStyle(
                            color: ThemeApp.mainWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
