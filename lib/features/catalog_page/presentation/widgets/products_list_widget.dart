import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';


class ProductListWidget extends StatelessWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
final List<ListProductModel> productInfo;
  ///list of banks products. when press on card - go to [DetailsPage]
  const ProductListWidget({super.key, required this.basicApiPageSettingsModel, required this.productInfo, });

  @override
  Widget build(BuildContext context) {
    return SliverContainer(
      margin: const EdgeInsets.only(top: 2, bottom: 72),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: basicApiPageSettingsModel.whereFrom == AppRoute.allBanksPage.name  ||
            basicApiPageSettingsModel.whereFrom == 'homePageBanks'
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
          top: basicApiPageSettingsModel.whereFrom == AppRoute.allBanksPage.name ||
              basicApiPageSettingsModel.whereFrom == 'homePageBanks' ? 15 : 47,
          right: 15,
          left: 15,
          bottom: 5,
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(

            childCount: productInfo.length,
            (BuildContext context,int index) =>  ProductCardWidgetWithButtons(
             basicApiPageSettingsModel: basicApiPageSettingsModel,
              productInfo: productInfo[index],
               productRating: '4.8',
               ),
          ),
        ),
      ),
    );
  }
}
