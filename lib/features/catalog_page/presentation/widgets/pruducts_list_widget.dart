import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ProductListWidget extends StatelessWidget {
  final String whereFrom;

  const ProductListWidget({super.key, required this.whereFrom});

  @override
  Widget build(BuildContext context) {
    return SliverContainer(
      margin: const EdgeInsets.only(top: 2, bottom: 72),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: whereFrom == AppRoute.allBanksPage.name
            ? const SizedBox.shrink()
            : const Padding(
                padding: EdgeInsets.symmetric(vertical: 17),
                child: Text(
                  'Найдено (132 шт.)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeApp.darkestGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      ),
      sliver: SliverPadding(
        padding: EdgeInsets.only(
          top: whereFrom == AppRoute.allBanksPage.name ? 15 : 47,
          right: 15,
          left: 15,
          bottom: 5,
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) => const ProductCardWidgetWithButtons(
                productName: 'Тинькофф Black',
                productShortDescription:
                    'На остаток - до 5%\nБесплатное обслуживание\nСнятие без % - 500 000 руб.\nДоставка 1-2 дня\nБез овердрафта',
                productRating: '4.8',
                bankLogoIconPath: 'assets/icons/tinkoff_logo_icon.svg'),
          ),
        ),
      ),
    );
  }
}
