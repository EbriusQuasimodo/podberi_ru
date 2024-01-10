import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

import 'common_helpers_widgets/product_card_widget_without_buttons.dart';

class BestDebitCardsWidget extends ConsumerWidget {
  final List<ListDebitCardsModel> debitCards;
  ///best debit cards widget when pressed go to [DetailsPage]
  const BestDebitCardsWidget({super.key, required this.debitCards});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30, bottom: 21),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 22,
              ),
              child: Text(
                'Дебетовые карты',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
             SizedBox(
                    height: 190,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        itemCount: debitCards.length < 6 ? debitCards.length :  6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return BankProductCardWidgetWithoutButtons(
                              productInfo: debitCards[index],
                              onTap: () {
                                ref.watch(goRouterProvider).push(
                                    RouteConstants.details,
                                    extra: BasicApiPageSettingsModel(
                                        productTypeUrl: 'debit_cards',
                                        pageName: 'Дебетовые карты',
                                        productId: debitCards[index].id,
                                        bankDetailsModel: BankListDetailsModel(
                                            bankName: debitCards[index]
                                                .bankDetails
                                                !.bankName,
                                            logo: debitCards[index]
                                                .bankDetails
                                                !.logo)));
                              },
                              productRating: '4.8');
                        }),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    ref.watch(goRouterProvider).push(
                          RouteConstants.catalog,
                          extra: BasicApiPageSettingsModel(
                            productTypeUrl: ProductTypeEnum.debit_cards.name,
                            pageName: 'Дебетовые карты',
                            whereFrom: AppRoute.homePage.name,
                            filtersModel: FiltersModel(
                              banks: [],
                              paySystem: [],
                              cashBack: [],
                            ),
                          ),
                        );
                  },
                  child: const Text(
                    'Показать все',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
