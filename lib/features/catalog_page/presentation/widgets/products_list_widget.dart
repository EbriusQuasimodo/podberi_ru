import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

class ProductListWidget extends StatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final List<ListProductModel> productInfo;

  ///list of banks products. when press on card - go to [DetailsPage]
  ProductListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.productInfo,
  });

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final isar = Isar.getInstance();

  Future<bool> isItemDuplicate(ListProductModel productInfo) async {
    final count = await isar?.favoritesDebitCardsDatas
        .filter()
        .idContains(productInfo.id)
        .count();
    return count! > 0;
  }

  @override
  Widget build(BuildContext context) {
    return SliverContainer(
      margin: const EdgeInsets.only(top: 2, bottom: 72),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: widget.basicApiPageSettingsModel.whereFrom ==
                    AppRoute.allBanksPage.name ||
                widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks'
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text(
                  'Найдено (${widget.productInfo.length} шт.)',
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
          top: widget.basicApiPageSettingsModel.whereFrom ==
                      AppRoute.allBanksPage.name ||
                  widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks'
              ? 15
              : 47,
          right: 15,
          left: 15,
          bottom: 5,
        ),
        sliver: SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: widget.productInfo.length,
                  (BuildContext context, int index) {
            return ProductCardWidgetWithButtons(
                onTap: () {
                  setState(() {});
                },
                isFavorite: true,
                basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
                productInfo: widget.productInfo[index],
                productRating: '4.8');
            // return FutureBuilder(
            //     future: isItemDuplicate(widget.productInfo[index]),
            //   builder: (context, AsyncSnapshot snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       if (snapshot.data) {
            //         return ProductCardWidgetWithButtons(
            //             isFavorite: true,
            //             basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
            //             productInfo: widget.productInfo[index],
            //             productRating: '4.8');
            //       } else {
            //         return ProductCardWidgetWithButtons(
            //             isFavorite: false,
            //             basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
            //             productInfo: widget.productInfo[index],
            //             productRating: '4.8');
            //       }
            //     }
            //     return SizedBox(
            //       height: MediaQuery.of(context).size.height -72,
            //     );
            //   }
            // );
          }),
        ),
      ),
    );
  }
}
