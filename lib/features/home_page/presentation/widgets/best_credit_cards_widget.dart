import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/credit_cards_controller.dart';

import 'common_helpers_widgets/product_card_widget_without_buttons.dart';

class BestCreditCardsWidget extends ConsumerWidget {
  const BestCreditCardsWidget({super.key});

  ///best credit cards widget when pressed go to [DetailsPage]
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(creditCardsControllerProvider).when(
      data: (creditCards) {
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
                            onTap: () {},
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
                      onTap: () {},
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
      },
      error: (error, _) {
        return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(
              top: 2,
            ),
            padding: const EdgeInsets.only(top: 30, bottom: 21),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: const Center(
              child: Text('произошла ошибка'),
            ),
          ),
        );
      },
      loading: () {
        return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(
              top: 2,
            ),
            padding: const EdgeInsets.only(top: 30, bottom: 21),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
