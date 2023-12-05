import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'promocode_card_widget.dart';

class PromoCodesListWidget extends StatelessWidget {
  const PromoCodesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStack(
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
                top: 15, right: 15, left: 15, bottom: 15),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 10,
                      (context, index) {
                    return const PromoCodesCardWidget(
                        productName: 'МногоЛосося',
                        productShortDescription:
                        'Много Лосося — ролл Снежная Калифорния в подарок при заказе от 1800 руб.!',
                        companyLogoIconPath:
                        'assets/icons/promo_codes_icons/mnogo_lososya_logo.svg',
                        color: Color(0xffFF5700));
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
