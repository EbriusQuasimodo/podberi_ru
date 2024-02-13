import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class AdvantagesRkoWidget extends StatelessWidget {
  final ListDebitCardsModel productInfo;

  const AdvantagesRkoWidget({
    super.key,
    required this.productInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30, bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Преимущества',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  itemCount: productInfo.features.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeApp.grey),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 28, left: 28, bottom: 29),
                            child: Image.asset(
                              'assets/images/rko_advantages_example_image.png',
                              height: 144,
                              width: 144,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 15, right: 15),
                            child: Text(
                              productInfo.features[index],
                              style: const TextStyle(
                                  color: ThemeApp.backgroundBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
