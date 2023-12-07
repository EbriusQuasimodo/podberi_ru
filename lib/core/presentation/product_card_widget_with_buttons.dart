import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/bank_products_model.dart';

///кастомный виджет с карточкой банковсвкого продукта (отличительные особенности - есть кнопки добавить в избранное и сравнение)
class ProductCardWidgetWithButtons extends ConsumerWidget {
  final String productRating;
  final ListProductModel? productInfo;

  const ProductCardWidgetWithButtons(
      {super.key,
      required this.productRating,
      this.productInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.green
          // color: Color(int.parse(
          //     '0xff${productInfo?.bankDetails?.color}')), //int.parse('0xff${productInfo?.bankDetails?.color}')
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
                'http://62.109.21.134:8080/picture/${productInfo?.bankDetails?.picture}',
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
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              "${productInfo?.feature1}\n${productInfo?.feature2}\n${productInfo?.feature3}\n${productInfo?.feature4}",
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
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
                  ref.watch(goRouterProvider).push(
                        RouteConstants.details,
                      );
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
