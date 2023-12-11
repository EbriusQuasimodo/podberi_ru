import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/domain/details_parameters_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

import 'common_helpers_widgets/product_card_widget_without_buttons.dart';

class BestCreditCardsWidget extends ConsumerWidget {
  final List<ListProductModel> creditCards;
  const BestCreditCardsWidget({super.key, required this.creditCards});

  ///best credit cards widget when pressed go to [DetailsPage]
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
                    'Кредитные карты',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                creditCards.isNotEmpty
                ? SizedBox(
                  height: 190,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return BankProductCardWidgetWithoutButtons(
                            productInfo: creditCards[index],
                            onTap: () {
                              ref.watch(goRouterProvider).push(RouteConstants.details,
                                  extra: DetailsParameters(
                                      id: creditCards[index].id,
                                      whereFrom: 'Кредитные карты',
                                      productType: 'credit_cards',
                                      bankName: creditCards[index].bankDetails?.bankName,
                                      bankLogoPath: creditCards[index].bankDetails?.picture));
                            },
                            productRating: '4.8');
                      }),
                )
                :Text('произошла какая-то ошибка'),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 22,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ref.watch(goRouterProvider).push(RouteConstants.catalog,
                            extra:  'Кредитные карты',);
                      },
                      child: const Text(
                        'Показать все',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
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
