import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

class ProductCardWidgetWithButtons extends ConsumerWidget {
  final String productRating;
  final ListProductModel? productInfo;

  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///кастомный виджет с карточкой банковсвкого продукта
  ///(отличительные особенности - есть кнопки добавить в избранное и сравнение)
  const ProductCardWidgetWithButtons({
    super.key,
    required this.productRating,
    this.productInfo,
    required this.basicApiPageSettingsModel,
  });

  List<Widget> list() {
    var list = <Widget>[];

    for (int i = 0; i < 4; i++) {
      list.add(
        Text(
          "${productInfo!.features[i]}",
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: ThemeApp.mainWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: productInfo != null ? Colors.green : ThemeApp.darkestGrey,
        //color: Color(int.parse(
        //   '0xff${productInfo?.bankDetails?.color}')), //int.parse('0xff${productInfo?.bankDetails?.color}')
      ),
      width: 280,
      height: 190,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                '${Urls.api.files}/${productInfo?.bankDetails?.picture}',
                height: 32,
                width: 36,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 86,
            child: Text(
              "${productInfo?.cardName}",
              maxLines: 3,
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          productInfo!.features.isNotEmpty
              ? Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list(),
                  ),
                )
              : const SizedBox.shrink(),
          Positioned(
              right: 16,
              bottom: 70,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: ThemeApp.mainWhite,
                    size: 20,
                  ),
                  Text(
                    productRating,
                    style: const TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              )),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 90,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  ref.watch(goRouterProvider).push(RouteConstants.details,
                      extra: BasicApiPageSettingsModel(
                          productTypeUrl:
                              basicApiPageSettingsModel.productTypeUrl,
                          pageName: basicApiPageSettingsModel.pageName,
                          productId: productInfo?.id,
                          bankDetailsModel: BankDetailsModel(
                              bankName: productInfo?.bankDetails?.bankName,
                              picture: productInfo?.bankDetails?.picture)));
                },
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/nav_bar_icons/comparison_page.svg',
                      color: ThemeApp.mainWhite,
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/nav_bar_icons/favorites_page.svg',
                      color: ThemeApp.mainWhite,
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
