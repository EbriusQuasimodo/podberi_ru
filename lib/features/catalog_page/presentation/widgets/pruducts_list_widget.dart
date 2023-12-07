import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/bank_products_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

///list of banks products. when press on card - go to [DetailsPage]
class ProductListWidget extends StatelessWidget {
  final String whereFrom;
final List<ListProductModel> productInfo;
  const ProductListWidget({super.key, required this.whereFrom, required this.productInfo});

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
            :  Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text(
                  'Найдено (${productInfo.length} шт.)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
            childCount: productInfo.length,
            (BuildContext context,int index) =>  ProductCardWidgetWithButtons(
              productInfo: productInfo[index],
               productRating: '4.8',
               ),
          ),
        ),
      ),
    );
  }
}
